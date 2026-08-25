# Zynost Client — Public Reference

[![CI](https://github.com/umarae-dev/goro-app-overview/actions/workflows/ci.yml/badge.svg)](https://github.com/umarae-dev/goro-app-overview/actions/workflows/ci.yml)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)

Zynost Client is the user-facing application for the wider Zynost ecosystem. The production app is built with Flutter and connects Zynost Intelligence research workflows with Zynost Pay checkout.

This repository is intentionally smaller than the commercial application. It contains a **runnable public Dart reference** for the client trust boundaries that matter during review, plus the architecture and security documentation needed to understand how the client fits into the BNB Chain stack.

**Live product:** https://app.zynost.com  
**Production client:** Flutter / Dart  
**Public reference:** pure Dart, no production credentials required  
**License:** Apache-2.0

## Why this repository exists

A production client contains things that should not be copied into a public hackathon repository just to make the repository look larger: authentication wiring, operational configuration, unreleased work, private provider settings and other sensitive implementation details.

The safer approach is to publish the parts reviewers actually need to inspect and test.

This repository therefore demonstrates three concrete rules:

- analysis results are treated as server-owned objects rather than trusted local state;
- checkout follows an explicit state machine instead of treating a button tap as payment success;
- subscription entitlement is granted only after confirmed settlement.

## BNB Chain path

```text
User
  │
  ▼
Zynost Client
  │
  ├── research requests ──────► Zynost Intelligence
  │
  └── subscription checkout ──► Zynost Pay
                                   │
                                   ├── direct stablecoin path
                                   └── ERC-4337 sponsored path
                                              │
                                              ▼
                                       BNB Smart Chain
```

BNB Smart Chain is represented by chain ID `56` in the public reference. The repository models the user-visible payment lifecycle while leaving wallet secrets, sponsorship policy, settlement verification and merchant authentication in their proper trust boundaries.

## Runnable reference

The public package has no production hostname and no credential requirement.

```bash
dart pub get
dart analyze
dart test
dart run example/main.dart
```

The example walks a BNB checkout through:

```text
idle
  → awaiting wallet
  → awaiting signature
  → submitted
  → backend-confirmed settlement
```

An invalid jump directly from `idle` to `confirmed` is rejected by the state machine. A submitted transaction also does not grant entitlement unless the backend-confirmed flag is true.

The tests cover these invariants as executable behavior rather than documentation-only claims.

## What is public here

- `lib/zynost_client_reference.dart` — small client trust/state reference;
- `test/` — checkout and analysis ownership tests;
- `example/` — runnable BNB checkout example;
- `ARCHITECTURE.md` — system map and BNB integration boundary;
- `PROVENANCE.md` — what came from production knowledge and what was written specifically for public review;
- `PUBLIC_PRIVATE_BOUNDARY.md` — explicit disclosure boundary;
- `SECURITY.md` — security rules and responsible disclosure;
- `scripts/check-public-repo.mjs` — CI guard against common credential and sensitive-file mistakes;
- GitHub Actions CI, CODEOWNERS and a public-source PR checklist.

## What stays private

The following are not required to evaluate this public reference and remain outside the repository:

- the complete production Flutter source tree;
- authentication/session implementation details;
- live API configuration not needed for public review;
- access tokens, OAuth secrets and database credentials;
- merchant API keys and webhook signing secrets;
- wallet private keys or recovery phrases;
- private RPC/provider credentials;
- production service-account material;
- user, merchant or customer data;
- exact anti-abuse, fraud, rate-limit and sponsorship thresholds;
- admin-only operational routes, monitoring internals and runbooks;
- unreleased product features.

See [`PUBLIC_PRIVATE_BOUNDARY.md`](PUBLIC_PRIVATE_BOUNDARY.md) for the full rule set.

## Safe configuration examples

`.env.example` contains placeholders only:

```text
PUBLIC_API_BASE_URL=https://example.invalid
PUBLIC_BNB_RPC_URL=https://example.invalid
PUBLIC_WALLETCONNECT_PROJECT_ID=replace-with-your-own-public-id
```

`example.invalid` is deliberately non-production. Do not replace these values in commits with anything copied from a live environment.

## How this relates to the rest of Zynost

The public repositories are separated by trust boundary instead of publishing one oversized production dump:

- [Zynost Intelligence](https://github.com/umarae-dev/tradeos-backend-overview) — evidence and decision-intelligence reference;
- [Zynost Pay](https://github.com/umarae-dev/zynost-pay-overview) — payment client core;
- [Zynost Gateway](https://github.com/umarae-dev/zynost-gateway-backend-overview) — merchant orders and settlement verification;
- [Zynost Paymaster](https://github.com/umarae-dev/zynost-paymaster-overview) — ERC-4337 sponsorship layer;
- [UQX BNB Contracts](https://github.com/umarae-dev/uqx-bnb-contracts-overview) — BNB-native token, presale and vesting contracts.

Together they show the BNB-facing product path without forcing private commercial code or credentials into public source control.

## Production lineage

The private Zynost client was already under active development before this public reference was prepared. The repository does not pretend that its public commit history is the entire product-development history.

The production app already uses Flutter/Dart and integrates research, server-owned analysis runs and Zynost Pay checkout. The Dart code published here is a clean public reference written specifically so those trust rules can be compiled, tested and reviewed without exposing live application wiring.

See [`PROVENANCE.md`](PROVENANCE.md).

## CI and public-source safety

Every push to `main` and every pull request runs:

- dependency installation;
- credential/sensitive-file guard;
- Dart format verification;
- static analysis;
- unit tests;
- the runnable BNB reference example.

The repository also has CODEOWNERS and a PR checklist requiring manual disclosure review. Automated scanning is useful, but it is not treated as permission to blindly copy files from production.

See [`RELEASE_CHECKLIST.md`](RELEASE_CHECKLIST.md) before a hackathon submission or tagged release.

## License

Apache License 2.0. See [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE).

The source license does not grant rights to use Zynost, Zynost Pay, UQX or associated branding as trademarks beyond normal attribution and description of origin.

## Security

Do not open a public issue containing credentials, wallet secrets, user data or live exploit details. See [`SECURITY.md`](SECURITY.md) for the disclosure process.
