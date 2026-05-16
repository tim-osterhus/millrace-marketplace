# Package Boundary

Millrace marketplace packages are optional extensions for Millrace OS. They are not part of runtime authority and they are not required for core operation.

Every package should be reviewed through the Local Capability Gateway before install, enable, update, dispatch, or uninstall. The gateway validates package metadata, maps requested product capabilities to base execution grants, applies credential and approval requirements, dispatches typed requests, and records receipts or diagnostics.

Packages may describe optional behavior such as repeatable workflows, channel surfaces, runner bridges, integration adapters, memory structures, UI surfaces, and diagnostics.

Packages may reference Millrace skills by immutable source refs when a package needs agent guidance or operating context. Skills are separate artifacts and must not be treated as executable package runtime code.

Packages must not:

- mutate queues, work items, runs, approvals, incidents, traces, terminal outcomes, or artifact truth directly;
- store private credentials in package source;
- bypass gateway credential requirements;
- call raw shell, filesystem, network, browser, or SQLite paths outside declared capabilities;
- include private planning content or private integration material;
- imply hosted marketplace publishing or paid package distribution in M2.5.

The initial reference set should stay small and prove package mechanics without becoming a catalog.
