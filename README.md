# Zynost Client — Public Reference

[![CI](https://github.com/umarae-dev/goro-app-overview/actions/workflows/ci.yml/badge.svg)](https://github.com/umarae-dev/goro-app-overview/actions/workflows/ci.yml)
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)

Zynost Client is the user-facing application for the wider Zynost ecosystem. The production client connects **Zynost Intelligence**, the digital-asset decision-intelligence layer, with **Zynost Pay**, the non-custodial crypto payment layer.

This repository is intentionally smaller than the commercial application. It contains a runnable public Dart reference for client trust boundaries plus the architecture and security documentation needed to understand how the client fits into the wider Zynost and BNB Chain stack.

**Live product:** https://app.zynost.com  
**Production client:** Flutter / Dart  
**Public reference:** pure Dart, no production credentials required  
**License:** Apache-2.0

## Reviewer start here

- [`ONCHAIN_EVIDENCE.md`](ONCHAIN_EVIDENCE.md) — routing page to canonical contract, settlement and Paymaster evidence;
- [`PRODUCTION_LINEAGE.md`](PRODUCTION_LINEAGE.md) — relationship between public references and the live private systems;
- [`REVIEW_BRIEF.md`](REVIEW_BRIEF.md) — concise technical ownership and trust-boundary map;
- [`DEMO_GUIDE.md`](DEMO_GUIDE.md) — verification-first guide for reviewing the live product.

This client repository does not duplicate contract addresses, wallet secrets, merchant credentials or production settlement records that belong to subsystem repositories.

## Product boundary

Zynost is not positioned as a fixed-count AI-agent wrapper. The intelligence backend forms source-backed evidence, deterministic intelligence and decision context before any optional natural-language synthesis is requested.

The client treats analysis as server-owned decision objects rather than inventing market measurements locally.

```text
User
  │
  ▼
Zynost Client
  │
  ├── decision-intelligence requests ──► Zynost Intelligence
  │                                      │
  │                                      ├── evidence engine
  │                                      ├── deterministic intelligence
  │                                      └── optional synthesis
  │
  └── subscription checkout ───────────► Zynost Pay
                                         │
                                         ├── direct stablecoin path
                                         └── supported sponsored path
                                                    │
                                                    ▼
                                             blockchain settlement
```

## Runnable reference

The public package has no production hostname and no credential requirement.

```bash
dart pub get
dart analyze
dart test
dart run example/main.dart
```

The checkout example models an explicit lifecycle rather than treating a UI button tap as settlement:

```text
idle
  → awaiting wallet
  → awaiting signature
  → submitted
  → backend-confirmed settlement
```

An invalid jump directly from `idle` to `confirmed` is rejected. A submitted transaction also does not grant entitlement unless backend-confirmed settlement state is present.

## Public trust rules

This reference demonstrates three core client rules:

- intelligence outputs are server-owned objects rather than locally fabricated decision state;
- checkout follows an explicit state machine;
- subscription entitlement is granted only after confirmed settlement.

## What is public here

- `lib/zynost_client_reference.dart` — client trust/state reference;
- `test/` — checkout and analysis ownership tests;
- `example/` — runnable checkout example;
- `ARCHITECTURE.md` — client/system map;
- `PROVENANCE.md` — public/private lineage;
- `PRODUCTION_LINEAGE.md` — ecosystem-wide production/public-release relationship;
- `ONCHAIN_EVIDENCE.md` — canonical evidence routing;
- `PUBLIC_PRIVATE_BOUNDARY.md` — disclosure boundary;
- `SECURITY.md` — security rules and responsible disclosure;
- CI, CODEOWNERS and public-source safety checks.

## What stays private

The following remain outside this public repository:

- the complete production Flutter source;
- authentication/session implementation details;
- live API configuration not needed for public review;
- access tokens, OAuth secrets and database credentials;
- merchant API keys and webhook signing secrets;
- wallet private keys or recovery phrases;
- private RPC/provider credentials;
- service-account material;
- user, merchant or customer data;
- exact anti-abuse, fraud, rate-limit and sponsorship thresholds;
- admin-only operational routes and runbooks;
- unreleased product features.

## Canonical repository map

- [Zynost Intelligence](https://github.com/umarae-dev/tradeos-backend-overview) — evidence-first decision-intelligence reference;
- [Zynost Client](https://github.com/umarae-dev/goro-app-overview) — client trust/state reference;
- [Zynost Pay](https://github.com/umarae-dev/zynost-pay-overview) — payment/wallet browser client reference;
- [Zynost Gateway](https://github.com/umarae-dev/zynost-gateway-backend-overview) — merchant orders, settlement verification and evidence;
- [Zynost Paymaster](https://github.com/umarae-dev/zynost-paymaster-overview) — ERC-4337 sponsorship layer;
- [UQX BNB Contracts](https://github.com/umarae-dev/uqx-bnb-contracts-overview) — token, vesting, presale and deployment evidence;
- [UQX Android App Overview](https://github.com/umarae-dev/uqx-app-overview) — self-custody Web3 wallet and device-security architecture;
- [UQX Backend Overview](https://github.com/umarae-dev/uqx-backend-overview) — legacy/account-service backend boundary retained during migration where applicable.

The UQX product is currently presented as a self-custody Web3 wallet. Older mining/reward/referral terminology in historical backend or contract identifiers should not be carried into current Zynost ecosystem branding.

## Production lineage

The private Zynost client predates this public reference. Public commit history represents the safe-publication timeline, not the full product-development timeline.

## CI and public-source safety

Every push to `main` and every pull request runs dependency installation, credential/sensitive-file checks, Dart formatting verification, static analysis, tests and the runnable reference example.

## Language discipline

Public product copy should prefer precise terms such as **source-backed evidence**, **deterministic intelligence**, **on-chain settlement**, **self-custody** and **device-owned wallet credentials**. Avoid vague credibility adjectives such as “real” when a precise technical description is available.

## License

Apache License 2.0. See [`LICENSE`](LICENSE) and [`NOTICE`](NOTICE).

The source license does not grant rights to use Zynost, Zynost Pay or UQX branding beyond normal attribution and description of origin.
