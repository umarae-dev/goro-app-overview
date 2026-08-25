# Zynost Technical Review Brief

## Project

**Zynost — Decision Intelligence and BNB-Native Payment Ecosystem**

## One-line summary

Zynost turns fragmented crypto market evidence into one explainable Decision Brief, then connects paid access to non-custodial BNB Smart Chain settlement and a BNB-native UQX ecosystem.

## Product status

Zynost is a live production ecosystem, not a documentation-only concept. The public repositories are scoped review surfaces for production-safe code, contracts, tests and architecture, while the complete commercial systems remain private where disclosure would expose credentials, customer data, operational controls or unrelated proprietary implementation.

Live product surfaces:

- Zynost Intelligence: https://app.zynost.com
- Zynost website: https://zynost.com
- Zynost Pay: https://pay.zynost.com
- UQX presale: https://zynost.com/presale

## Problem

Crypto users jump between charts, order books, news, on-chain data and conflicting signals. The difficult part is deciding which evidence matters, where evidence conflicts, and what would invalidate a thesis.

Crypto-native products also make access and payment unnecessarily fragmented. Zynost links research access to non-custodial on-chain settlement while keeping each subsystem independently reviewable.

## Solution

Zynost combines four layers:

1. **Decision intelligence** — evidence-first market research, consensus, FlowState, Market Twin and Decision Brief workflows.
2. **Client experience** — a user-facing application that treats analysis and payment as server-confirmed state rather than trusting local UI state.
3. **Zynost Pay** — non-custodial stablecoin checkout with a BNB Smart Chain path and ERC-4337 gas sponsorship.
4. **UQX** — a BNB-native token, presale, vesting, governance and consumer-wallet/community layer.

## BNB Smart Chain integration

The live ecosystem includes BSC subscription settlement, ERC-4337 gas sponsorship, UQX token/presale/vesting contracts, governance controls and a BNB-first self-custody wallet path.

Network: **BNB Smart Chain mainnet, chain ID 56**.

Exact addresses and transaction hashes are intentionally **not duplicated in this client repository**. Use [`ONCHAIN_EVIDENCE.md`](ONCHAIN_EVIDENCE.md) as the evidence router to the canonical subsystem repositories.

## Canonical repository ownership

- **Decision intelligence:** `tradeos-backend-overview`
- **Client trust/state:** `goro-app-overview`
- **Checkout/wallet browser core:** `zynost-pay-overview`
- **Merchant orders + BSC settlement:** `zynost-gateway-backend-overview`
- **ERC-4337 Paymaster:** `zynost-paymaster-overview`
- **UQX contracts, deployments and UQX transaction evidence:** `uqx-bnb-contracts-overview`
- **UQX Android architecture:** `uqx-app-overview`
- **UQX backend architecture:** `uqx-backend-overview`

This ownership model prevents judges or reviewers from seeing the same contract or transaction evidence maintained in multiple places.

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
2. Read [`ONCHAIN_EVIDENCE.md`](ONCHAIN_EVIDENCE.md) to choose the canonical subsystem repository.
3. Inspect `uqx-bnb-contracts-overview` for UQX contracts/deployments/evidence.
4. Inspect `zynost-gateway-backend-overview` for settlement evidence and production-derived settlement logic.
5. Inspect `zynost-paymaster-overview` for ERC-4337 sponsorship source/tests.
6. Inspect `zynost-pay-overview` for the production-derived checkout/wallet client core.
7. Run the documented public test suites, verify green CI, and compare the live products with the documented architecture.
