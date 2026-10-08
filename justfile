default:
    @just --list

# Validate the preset against Renovate's own schema
validate:
    pnpm dlx --package=renovate renovate-config-validator default.json

# Show what Renovate would raise for a local checkout (no network writes)
dry-run repo:
    cd {{repo}} && LOG_LEVEL=info RENOVATE_CONFIG_FILE= pnpm dlx renovate --platform=local
