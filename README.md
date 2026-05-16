# Millrace Marketplace

This repository is a public-safe reference marketplace for optional Millrace packages. It proves the package metadata, registry, compatibility, and fixture validation path used by Millrace OS without making optional packages part of the core runtime.

It is:

- a small baseline registry under `registry/`;
- a limited set of package category examples under `packages/`;
- authoring and review guidance under `docs/`;
- validation helpers under `tests/`.

It is not:

- a hosted package service;
- a broad package catalog;
- a credential store;
- a place for runtime state, operator notes, planning drafts, or private integration material;
- executable package code loaded by Millrace OS core.

Core Millrace OS must continue to run when this directory is absent or when no packages are installed. Package manifests are data-only. A package may reference an agent skill by immutable source ref, but this marketplace does not copy skill contents into package fixtures.

## Layout

- `registry/index.json` lists package IDs, versions, categories, manifest paths, and manifest checksums.
- `registry/compatibility.matrix.json` declares the accepted Millrace and manifest schema range for the reference fixtures.
- `packages/<package-id>/package.manifest.json` contains public-safe package metadata.
- `packages/invalid/` contains reject-path fixtures for core validation tests.
- `docs/authoring.md` explains how to write a reference package manifest.
- `docs/public-safety.md` records what must stay out of the public marketplace.
- `tests/validate-marketplace.sh` runs the local validation commands from the Millrace OS source tree.

## Reference Package Scope

The reference set intentionally covers only enough package categories to prove the foundation:

- `loop_pack`
- `integration_adapter`
- `channel_adapter`
- `memory_pack`
- `surface_pack`
- `diagnostic_pack`

Do not grow this into a catalog during foundation work. Add new packages only when a schema, registry, compatibility, or safety behavior needs direct fixture coverage.
