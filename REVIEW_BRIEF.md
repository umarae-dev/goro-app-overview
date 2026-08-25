# Zynost Technical Review Brief

## Project

**Zynost — Decision Intelligence and BNB-Native Payment Ecosystem**

## One-line summary

Zynost turns fragmented crypto market evidence into one explainable Decision Brief, then connects paid access to non-custodial BNB Smart Chain settlement and a BNB-native UQX token ecosystem.

## Product status

Zynost is a live production ecosystem, not a documentation-only concept. The public repositories are scoped review surfaces for production-safe code, contracts, tests and architecture, while the complete commercial systems remain private where disclosure would expose credentials, customer data, operational controls or unrelated proprietary implementation.

Live product surfaces:

- Zynost Intelligence: https://app.zynost.com
- Zynost website: https://zynost.com
- Zynost Pay: https://pay.zynost.com
- UQX presale: https://zynost.com/presale

## Problem

Crypto users jump between charts, order books, news, on-chain data and conflicting signals. The difficult part is deciding which evidence matters, where evidence conflicts, and what would invalidate a thesis.

At the same time, crypto-native products still make access and payment unnecessarily fragmented. A useful research product should be able to serve a user, settle access on-chain without taking custody of the user's wallet, and expose reusable infrastructure that can be independently inspected.

## Solution

Zynost combines four layers:

1. **Decision intelligence** — evidence-first market research, consensus, FlowState, Market Twin and Decision Brief workflows.
2. **Client experience** — a user-facing application that treats analysis and payment as server-confirmed state rather than trusting local UI state.
3. **Zynost Pay** — non-custodial stablecoin checkout with a BNB Smart Chain path and ERC-4337 gas sponsorship.
4. **UQX** — a BNB-native token, presale, vesting, governance and consumer-wallet/community layer.

## BNB Smart Chain integration

Current BNB-facing implementation includes:

- live USDT subscription settlement on BSC;
- an ERC-4337 v0.6 Verifying Paymaster;
- UQX fixed-supply token;
- UQX Presale with stablecoin payment and per-buyer on-chain allocation;
- UQX Vesting;
- timelock and Safe-based governance architecture;
- Android self-custody BNB wallet support in the private UQX application.

Network: **BNB Smart Chain mainnet, chain ID 56**.

## Main deployed contract

**UQX Presale**

`0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD`

Explorer:

https://bscscan.com/address/0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD

## Main public transaction proof

Real presale purchase:

`0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238`

Explorer:

https://bscscan.com/tx/0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238

Recorded result: successful BSC mainnet `buy(address,uint256)` call with **1 USDT paid and 200 UQX allocated**.

Additional transaction and deployment evidence is documented in [`ONCHAIN_EVIDENCE.md`](ONCHAIN_EVIDENCE.md).

## Production settlement evidence

The production billing system records completed Zynost subscription invoices paid in USDT on BSC. Two payments were independently matched to public BSC transfers without publishing customer identities:

- `0x2756bce009233683be9fd9f9828df27f4c2599c7070a4423c8bbe8d7c0e65a21` — 3.01 USDT;
- `0x5a5581669cb039e203a8a9a941bc52cd88adaad55cfcd093cc20816f0d96f208` — 3.00 USDT.

## Public repositories

- https://github.com/umarae-dev/tradeos-backend-overview
- https://github.com/umarae-dev/goro-app-overview
- https://github.com/umarae-dev/zynost-pay-overview
- https://github.com/umarae-dev/zynost-gateway-backend-overview
- https://github.com/umarae-dev/zynost-paymaster-overview
- https://github.com/umarae-dev/uqx-bnb-contracts-overview
- https://github.com/umarae-dev/uqx-app-overview
- https://github.com/umarae-dev/uqx-backend-overview

## What reviewers can run

Depending on the repository, public source includes runnable Dart references, Python/FastAPI components, TypeScript client core, Solidity contracts, Hardhat compilation/tests, examples, secret guards and GitHub Actions CI.

The public repositories are deliberately split by trust boundary. They are not represented as raw mirrors of entire private production repositories.

## Production lineage

The underlying products were already under private production development before the public overview/reference repositories were prepared. Public commit history reflects the publication history of the safe public artifacts, not the complete private development history.

See [`PRODUCTION_LINEAGE.md`](PRODUCTION_LINEAGE.md) and the individual repository `PROVENANCE.md` files.

## Security and trust model

- no user seed phrase or private key is required by the public services;
- merchant/customer payment funds are not custodied by the Paymaster;
- entitlement is not granted from a client-side button state;
- production secrets and database credentials are excluded from public repositories;
- public repositories include disclosure-boundary documentation and credential guards;
- internal tests are not represented as a third-party security audit.

## Reviewer path

1. Read [`PRODUCTION_LINEAGE.md`](PRODUCTION_LINEAGE.md).
2. Open [`ONCHAIN_EVIDENCE.md`](ONCHAIN_EVIDENCE.md).
3. Inspect the UQX contract repository and contract tests.
4. Inspect the Zynost Pay and Gateway production-derived cores.
5. Inspect the Paymaster source/tests.
6. Run the documented public test suites and verify green CI.
7. Open the live product surfaces and compare them with the documented architecture.
