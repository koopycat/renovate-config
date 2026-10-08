# renovate-config

Shared Renovate preset: few PRs, none of them fresh, majors on request, security fixes at once.

## Use it

```json
{
  "$schema": "https://docs.renovatebot.com/renovate-schema.json",
  "extends": ["github>koopycat/renovate-config"]
}
```

Install the [Renovate GitHub app](https://github.com/apps/renovate) on the repo and enable Dependabot alerts (Renovate reads them; leave Dependabot security updates off so the two bots do not open the same PR).

## What it does

| Update | Result |
|---|---|
| minor + patch | one `routine` PR a week (Monday before 06:00 Berlin), after 7 days (patches 3) |
| major | no PR until ticked on the Dependency Dashboard, after 30 days |
| GitHub Actions | own `actions` PR, pinned to commit SHAs |
| image digests | one `digests` PR |
| security | PR at once, label `security`, GitHub alerts and OSV |
| lockfile | refreshed monthly |

Built on `config:best-practices`; it opts out of `:pinDevDependencies` and the weekly lockfile PR.

## Per project

Add rules after the `extends`, for example a separate PR for risky libraries:

```json
"packageRules": [
  { "matchPackageNames": ["prisma", "@prisma/**", "stripe"], "matchUpdateTypes": ["minor", "patch"], "groupName": "sensitive" }
]
```

Auto-merge is deliberately not part of the preset.
