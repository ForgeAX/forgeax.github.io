# ForgeAX Engine + SDK: AI bootstrap contract

You are an AI coding Agent. Execute this contract exactly. Do not guess versions,
URLs, packages, or recovery steps.

## Release and installation surface

Resolve the selected npm tag below at execution time. Engine, View, and SDK must
resolve to the same exact release; record and pin that result.

| Channel | npm tag | Source | Intended use |
|:--|:--|:--|:--|
| Stable | `latest` | `stable` | Deliberate releases and small compatible patch fixes |
| Development | `next` | `main` | Frequent development builds; gameplay and API stability are not promised |

`@forgeax/engine` is one complete npm tarball containing all Engine modules,
locked common dependencies, declarations, WASM, and CLI. Unpatched third-party
platform binaries are exact-version optional dependencies selected for the
consumer machine. Import focused capabilities from Engine subpaths such as
`@forgeax/engine/ecs`; do not install `@forgeax/engine-*` packages
individually. `@forgeax/view` remains an independent tool with an exact Engine
dependency. The SDK carrier adds templates, skills, and public Engine source.

```ts
import { createRenderer } from '@forgeax/engine';
import { World } from '@forgeax/engine/ecs';
```

> [!IMPORTANT]
> Stable is the default. Development requires explicit `next` selection and a
> matching Engine, View, and SDK version. If the selected channel is unavailable
> or mismatched, stop; never mix channels or silently fall back. Pin the resolved
> version and keep the lockfile. Changing a channel tag does not update a pinned game.

## Mandatory rules

1. Use the public npm registry. `@forgeax/engine` is the public runtime and `forgeax`
   CLI. `@forgeax/engine-sdk` is the matching SDK carrier, not a game runtime
   dependency; never add it to the game's `package.json`.
2. After SDK installation, read `$SDK_ROOT/AGENTS.md` in full before running `new` or
   changing anything. It is the SDK authority. After game creation, read
   `$GAME_ROOT/AGENTS.md` in full before editing code or assets. It is the game
   authority. Follow both files; do not replace them with this page.
   In the game, `forge.json` owns configuration, entry, and plugins; stable GUIDs own
   asset identity; `skills/` is the single skill source of truth.
3. `sdk-manifest.json` is the SDK archive authority. Do not hand-edit the SDK stage,
   manifest, offline store, generated `dist/`, `node_modules/`, or `.forgeax/` state.
4. The SDK root and every child of it are forbidden game targets. Use a sibling or
   another external absolute path. `forgeax project new` must not overwrite an existing path.
5. Direct edit is the default. Do not start the ForgeAX closed loop unless the user
   explicitly authorizes it for the current task.
6. The user's machine must provide pnpm `>=12.10.1 <13`. Check `pnpm --version`
   before any bootstrap or project command; if it is unavailable or unsupported,
   stop and report the exact version instead of silently switching versions. This
   is the project package-manager contract; npm remains a supported public registry
   client and is not required to have the same version as pnpm.
7. The CLI is the only product tool entry. Prefer `--json`; discover operations with
   `forgeax help --tree --json`, then a focused help command such as
   `forgeax help project new --json`, instead
   of guessing inputs.

## Resolve and require one exact release

Requirements: Node.js `>=22.13.0`, pnpm `>=12.10.1 <13`, npm registry access, and an
empty parent directory.

```sh
set -eu

RELEASE_CHANNEL="${RELEASE_CHANNEL:-latest}"
case "$RELEASE_CHANNEL" in
  latest|next) ;;
  *) echo "Select latest or next explicitly." >&2; exit 18 ;;
esac
REGISTRY="https://registry.npmjs.org/"

PNPM_VERSION="$(pnpm --version 2>/dev/null || true)"
if ! node -e '
  const match = /^12\.(\d+)\.(\d+)$/.exec(process.argv[1] ?? "");
  const supported = match && (+match[1] > 10 || (+match[1] === 10 && +match[2] >= 1));
  process.exit(supported ? 0 : 1);
' "$PNPM_VERSION"; then
  echo "pnpm >=12.10.1 <13 is required on the user's machine; found ${PNPM_VERSION:-unavailable}. Activate pnpm 12.10.1+ and retry." >&2
  exit 19
fi

ENGINE_VERSION="$(npm view @forgeax/engine "dist-tags.$RELEASE_CHANNEL" --registry="$REGISTRY" 2>/dev/null || true)"
VIEW_VERSION="$(npm view @forgeax/view "dist-tags.$RELEASE_CHANNEL" --registry="$REGISTRY" 2>/dev/null || true)"
SDK_VERSION="$(npm view @forgeax/engine-sdk "dist-tags.$RELEASE_CHANNEL" --registry="$REGISTRY" 2>/dev/null || true)"

if [ -z "$ENGINE_VERSION" ]; then
  echo "@forgeax/engine is not resolvable from public npm; stop and report." >&2
  exit 20
fi
if [ -z "$SDK_VERSION" ]; then
  echo "@forgeax/engine-sdk is not published on public npm; stop and report." >&2
  exit 21
fi
if [ "$ENGINE_VERSION" != "$SDK_VERSION" ] || [ "$ENGINE_VERSION" != "$VIEW_VERSION" ]; then
  echo "Engine/View/SDK channel mismatch: $ENGINE_VERSION / ${VIEW_VERSION:-unavailable} / $SDK_VERSION" >&2
  exit 22
fi

SDK_ROOT="$PWD/forgeax-sdk-$SDK_VERSION"
GAME_ROOT="$PWD/forgeax-game"
test ! -e "$SDK_ROOT" || { echo "SDK target exists; do not overwrite." >&2; exit 22; }
test ! -e "$GAME_ROOT" || { echo "Game target exists; do not overwrite." >&2; exit 23; }

pnpm --registry="$REGISTRY" dlx "@forgeax/engine@$ENGINE_VERSION" sdk install "$SDK_ROOT" --version "$SDK_VERSION" --json
cat "$SDK_ROOT/AGENTS.md"
(cd "$SDK_ROOT" && node "$SDK_ROOT/bin/forgeax.mjs" project init --json)
node "$SDK_ROOT/bin/forgeax.mjs" project new "$GAME_ROOT" --template empty --json
cat "$GAME_ROOT/AGENTS.md"

cd "$GAME_ROOT"
pnpm exec forgeax project skill verify --json
pnpm exec forgeax project check --json
pnpm test
pnpm run typecheck
pnpm build
```

For development, set `RELEASE_CHANNEL=next` before executing the bootstrap. For a
3D game, select `--template game-3d` in its `project new` command.

The npm carrier intentionally omits the offline `store/pnpm`; its lockfile installs
the matching Engine dependencies from npm. The SDK-root `forgeax project init` is mandatory
after download: it checks the user's Node/pnpm/platform tuple and prepares native
dependencies before `new`.

> [!IMPORTANT]
> `forgeax project new` requires an explicit template selection. The bootstrap above uses
> `--template empty`, which creates the minimal project with `src/main.ts`. For a
> 3D game or a complete sample, use `--template game-3d` instead; it creates a
> runnable, contentful third-person reference rather than an empty 3D scene.
> Omitting `--template` fails closed with `sdk-template-required`.

`forgeax project new` is transactional and installs the SDK `skills/` as ordinary
files plus rebuildable Agent discovery links. If `project skill verify --json` is
not OK, run `project skill install --json`, verify again, and stop on any remaining error.

## Existing ForgeAX game

If the target already contains `forge.json`, `package.json`, and its entry module, do
not run `new` or install the SDK carrier into the game. Read its `AGENTS.md` and
record the installed Engine identity and lockfile before changing dependencies.
Reproduce failures on the original pinned Engine first. Do not automatically upgrade
an existing game as part of inspection. Run its checks and the acceptance below.

When migrating to another release, resolve and match the selected channel as above,
review its release notes, update exact dependencies and project-local skills through
the matching SDK's documented commands, and rerun the same reproduction and acceptance
in a fresh session. Keep old-release, new-release, and post-fix results distinct;
an upgrade or successful install alone is not a fix.

## Verify the authored game before delivery

After every gameplay, UI, asset, plugin, or dependency change, run acceptance on the
actual authored game. Initial scaffold checks and SDK canonical-template tests do not
accept later game edits. Complete this before saying the game is finished or handing
its preview to the user; publication is not required to trigger verification.

| Gate | Required evidence |
|:--|:--|
| Source and build | `project check --json`, relevant tests, typecheck, and build succeed on the final source. Add the smallest regression test for a reproduced defect. |
| Startup and runtime | Start the real game, wait for readiness, inspect diagnostics and native startup descendants, and fail on page, console, App, GPU, and failed-resource errors. |
| Appearance | Capture the actual game including UI. Open and inspect the screenshot for expected content, readable layout, and absence of blank output or error overlays. |
| Play | Drive at least one representative gameplay interaction and assert its visible result; exercise restart or reload and repeat the affected path. |
| Built output | Serve final `dist` over HTTP(S) with `project preview`, open that URL, and repeat startup, appearance, and key interaction checks. A source-dev pass does not accept the built artifact. |

Discover the installed command contracts first; older games may expose different inputs:

```sh
pnpm exec forgeax help dev --tree --json
pnpm exec forgeax dev start --headless false --json
pnpm exec forgeax dev status --json
pnpm exec forgeax dev capture --output artifacts/capture/game-ui.png --json
```

Inspect the returned status and capture report, including errors; `ok`, a job ID,
a URL, HTTP 200, or a root Fiber marked active alone does not establish game readiness.
`plugin-startup-failed` is a failed gate even when the root is active: inspect the
failed descendant and its source origin. Never swallow the exception, disable the
plugin, or bypass an SDK guard to make verification green. Fix the owning dependency,
then start a fresh session and repeat the failing path and all affected gates.
Use `dev reload` for ordinary iteration, `dev stop` for owned-session cleanup, and the
Browser capture section below for multi-step input and screenshots. If a browser or
target host is unavailable, report the blocked gate and preserved diagnostics; do not
report the game as verified or ask the user to perform the Agent's unfinished checks.

For third-party platform SDKs, read the currently installed SDK's contract. Await its
initialization in the browser/frontend owner before any dependent API or UI starts.
Separate consumer plugins declare native `inject` dependencies on the service published
only after initialization succeeds; plugin array order is not an async readiness
contract. Retain cleanup with that owner. Browser APIs stay outside Engine Workers;
module evaluation and Pack `build()` must not initialize the platform. Verify platform
features in the actual platform Preview/host too: a standalone development stub does
not prove injected-host initialization, storage, or multiplayer behavior.

## Browser capture, including game UI

Use the browser-compositor capture when a screenshot must include the rendered
Canvas and HTML/CSS/open Shadow DOM UI. `auto` is the default portable lane;
`software` is the explicit no-physical-GPU and/or no-display lane.

```sh
pnpm exec forgeax project capture --backend auto --require-ui --deterministic \
  --output artifacts/capture/game-ui.png --json

pnpm exec forgeax project capture --backend software --require-ui --deterministic \
  --output artifacts/capture/game-ui-software.png --json
```

`--require-ui` expects game UI under `#game-ui`. Capture waits for a real Engine
frame-submitted signal and a non-flat Canvas witness; game code may additionally set
`document.documentElement.dataset.forgeaxCaptureReady` to a named logical checkpoint.
Do not replace readiness with a guessed sleep. For a continuous playthrough,
discover `dev start`, `dev capture`, and `dev stop` through `forgeax help`; read
`$SDK_ROOT/skills/forgeax-engine-sdk/references/browser-capture-and-local-engine.md`
for the script contract and color-parity limits.

## Local Engine source iteration

A game uses its exact registry dependency unless an explicit local Engine binding is
present. The binding is development state and does not rewrite `forge.json` or the
game's package manifest.

```sh
pnpm exec forgeax project engine status --json
pnpm exec forgeax project engine use-local --path /absolute/path/to/forgeax-engine --json
pnpm exec forgeax project engine check --json
pnpm exec forgeax project engine unlink --json
```

`use-local` requires built Engine package entry points. `unlink` removes the sole
override and returns the game to normal SDK/registry resolution.

## Report

Report the selected channel, Engine/View/SDK and actual user-machine pnpm versions, absolute SDK/game paths,
every command, structured verification output, and the first error. A successful new
game has the SDK and game `AGENTS.md` read, SDK-root `project init`,
`project skill verify --json`, `project check --json`, tests, typecheck, and build all passing.
Game delivery additionally requires all authored-game acceptance gates above. Report
the tested source/dependency identity, host/backend, startup and error results, viewed
screenshot paths, exercised interactions and outcomes, built-preview results, and any
blocked or failed gates. Keep regression baseline and post-fix evidence separate.
