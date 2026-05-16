# Package Authoring

Reference packages are strict metadata fixtures. They describe package intent for Millrace OS validation and gateway review, but they do not ship executable package code.

## Manifest Rules

Each package manifest must be named `package.manifest.json` and use schema version `millrace.package.manifest.v1`.

Required top-level fields:

- `schema_version`
- `package`
- `compatibility`
- `capabilities`
- `credentials`
- `integrations`
- `skills`
- `artifacts`

Unknown fields are rejected. Keep manifests boring and explicit.

## Package Fields

`package` must include:

- `id`: stable package ID
- `name`: public package name
- `version`: semantic version
- `category`: one supported package category

Supported reference categories are `loop_pack`, `integration_adapter`, `channel_adapter`, `memory_pack`, `surface_pack`, and `diagnostic_pack`.

## Compatibility

`compatibility.millrace` must use a bounded range such as `>=0.1.0 <1.0.0`. Open-ended ranges are rejected.

`compatibility.manifest_schema` must be `millrace.package.manifest.v1`.

## Capabilities And Credentials

`capabilities` must be non-empty and should use narrow product capability names. Do not request raw shell, raw filesystem, raw network, direct database, or direct runtime mutation authority through package metadata.

Credentials are declared by ID and broker only. Do not put tokens, secrets, account values, or environment-specific paths in package source. Integrations may reference only declared credential IDs.

## Skill References

Packages may reference skills as metadata, but must not bundle skill contents. A skill reference must be immutable:

```json
{
  "id": "check-completion",
  "source_ref": "git+https://github.com/tim-osterhus/millrace-skills.git@0123456789abcdef0123456789abcdef01234567#check-completion"
}
```

The revision segment must be a 40-character commit hash.

## Registry Updates

After changing a valid package manifest, update `registry/index.json` with the manifest SHA-256 checksum. The registry checksum covers the exact manifest bytes.
