# Public Safety

Marketplace files must be safe to publish. The reference repo should contain package metadata and docs only.

Do not include:

- personal machine paths;
- local runtime state;
- credentials, tokens, API keys, or OAuth client secrets;
- private product strategy, planning drafts, or implementation notes;
- private integration names or data;
- copied skill content;
- executable package entrypoints.

Use placeholder credential IDs such as `docs_token` only when needed to exercise validation behavior. Credential values belong in a caller-owned broker or local state outside package source.

The public-safety scan covers Markdown and JSON files outside `packages/invalid/`. Invalid fixtures may contain deliberately unsafe strings only when they are required to prove rejection behavior.

Reference package docs should explain package intent and validation boundaries, not operational internals.
