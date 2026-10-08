# Agent instructions for renovate-config

Viktor's shared Renovate preset. Projects opt in with `"extends": ["github>koopycat/renovate-config"]` in their own `renovate.json`.
This repo holds only `default.json`; it must stay readable without access grants, so it contains no secrets and no project-specific rules.

## Commands

```bash
just validate          # Renovate's own schema check of default.json
just dry-run <repo>    # what Renovate would raise for a local checkout (needs GITHUB_COM_TOKEN)
```

## Invariants

- Project-specific rules (a `sensitive` group for prisma/stripe, a custom manager for a Dockerfile) belong in the project's `renovate.json`, after the `extends`.
- Automerge is off. A project turns it on itself, with `"platformAutomerge": false` where GitHub cannot require status checks.
- Run `just validate` and a `just dry-run` against a real repo before every push; changing a rule changes every consuming repo.
- Pin a project to a tag (`github>koopycat/renovate-config#v1`) when it must not follow `main`.
- Commits: Conventional Commits, single line.
