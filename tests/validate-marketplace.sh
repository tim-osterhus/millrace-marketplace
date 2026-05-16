#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
MARKETPLACE_DIR=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
CORE_DIR=$(CDPATH= cd -- "$MARKETPLACE_DIR/../../source/millrace-os" && pwd)

cd "$CORE_DIR"

cargo test --test package_manifest_registry
cargo test --test package_lifecycle
cargo test --test package_manifest_registry marketplace_registry_index_and_compatibility_matrix_validate_as_metadata_only
cargo test --test package_manifest_registry public_safety_scan_rejects_private_material_in_marketplace_docs_and_fixtures
cargo run --bin millrace-os -- --json diagnostics \
  --registry-file ../../extras/millrace-marketplace/registry/index.json \
  --compatibility-file ../../extras/millrace-marketplace/registry/compatibility.matrix.json
