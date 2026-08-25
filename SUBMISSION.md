# BNB Hack Submission Draft

This file is written to be copied into a hackathon form without turning the submission into a wall of marketing copy. Replace the demo-video placeholder after the final video is uploaded.

## Project name

**Zynost — Decision Intelligence and BNB-Native Payment Ecosystem**

## Track

**AI**

## One-line pitch

Zynost turns fragmented crypto market evidence into one explainable Decision Brief, then connects paid access to non-custodial BNB Smart Chain settlement and a BNB-native UQX token ecosystem.

## Short description

Zynost is a live crypto decision-intelligence platform built around a simple problem: traders have more data than they can reliably turn into a decision. The system combines deterministic market evidence with AI-assisted synthesis so the final output is an explainable Decision Brief rather than another isolated signal.

BNB Smart Chain is part of the production path, not a presentation-only integration. Zynost subscriptions have been paid in USDT on BSC, Zynost Pay provides non-custodial checkout, an ERC-4337 Verifying Paymaster provides the gas-sponsorship layer, and UQX adds an on-chain token, presale, vesting, governance and consumer-wallet layer.

## Problem

Crypto users jump between charts, order books, news, on-chain data and conflicting signals. Most products add another stream of information. The difficult part is deciding which evidence matters, where evidence conflicts, and what would invalidate a thesis.

At the same time, crypto-native products still make access and payment unnecessarily fragmented. A useful research product should be able to serve a user, settle access on-chain without taking custody of the user's wallet, and expose reusable infrastructure that other builders can inspect.

## Solution

Zynost combines four layers:

1. **Decision intelligence** — evidence-first market research, consensus, FlowState and Decision Brief workflows.
2. **Client experience** — a user-facing application that treats analysis and payment as server-confirmed state instead of trusting local UI state.
3. **Zynost Pay** — non-custodial stablecoin checkout with a BNB Smart Chain path and ERC-4337 gas sponsorship.
4. **UQX** — a BNB-native token, presale, vesting and governance layer connected to the wider ecosystem.

The result is one product path from market evidence to a user decision, paid access, and BNB-native on-chain participation.

## Why BNB Chain

BNB Smart Chain gives the ecosystem a low-cost EVM execution layer with mature wallet and stablecoin support. The production integration currently uses BSC mainnet, chain ID 56.

The BNB-facing implementation includes:

- live USDT subscription settlement on BSC;
- an ERC-4337 v0.6 Verifying Paymaster;
- the UQX fixed-supply token;
- UQX Presale with USDT / USDC payment and per-buyer on-chain allocation;
- UQX Vesting;
- timelock and Safe-based governance architecture.

## Main deployed contract

**UQX Presale — BSC mainnet**

`0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD`

Explorer:
https://bscscan.com/address/0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD

## Main transaction proofs

### Real presale purchase

`0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238`

https://bscscan.com/tx/0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238

Successful BSC mainnet `buy(address,uint256)` call. The contract event records 1 USDT paid and 200 UQX allocated.

### Successful Presale contract interaction

`0x2968e14c1781b94e32aa1715dd38486001417c8400b1fe1453d9917bfafc599a`

https://bscscan.com/tx/0x2968e14c1781b94e32aa1715dd38486001417c8400b1fe1453d9917bfafc599a

Successful direct payment-token configuration call on the production Presale contract.

Additional on-chain evidence is documented in [`HACKATHON_EVIDENCE.md`](HACKATHON_EVIDENCE.md).

## Production usage evidence

The production Zynost billing database records three completed subscription invoices paid with USDT on BSC. During submission review, two were independently matched to their public BSC transfers without exporting customer identity or wallet data:

- `0x2756bce009233683be9fd9f9828df27f4c2599c7070a4423c8bbe8d7c0e65a21` — 3.01 USDT;
- `0x5a5581669cb039e203a8a9a941bc52cd88adaad55cfcd093cc20816f0d96f208` — 3.00 USDT.

This evidence is deliberately narrow: it proves real production settlement without turning private customer records into hackathon material.

## Open-source repositories

Primary submission / client reference:
https://github.com/umarae-dev/goro-app-overview

Supporting public repositories:

- Intelligence: https://github.com/umarae-dev/tradeos-backend-overview
- Zynost Pay client core: https://github.com/umarae-dev/zynost-pay-overview
- Zynost Gateway: https://github.com/umarae-dev/zynost-gateway-backend-overview
- ERC-4337 Paymaster: https://github.com/umarae-dev/zynost-paymaster-overview
- UQX contracts: https://github.com/umarae-dev/uqx-bnb-contracts-overview

The repositories use explicit public/private boundaries. Reusable and production-safe components are public; production credentials, customer data and unrelated commercial internals are not. The submission does not claim that private commercial source is open source.

## What judges can run

Depending on the repository, the public source includes runnable Dart references, Python/backend examples, TypeScript client core, Solidity contracts, Hardhat compilation and contract tests. GitHub Actions is used to run repository-specific checks, tests and public-secret guards.

The ERC-4337 repository includes production-safe Paymaster source and tests. The UQX repository includes the BNB token, presale and vesting contracts. The client repository includes an executable state-machine reference showing that subscription entitlement requires backend-confirmed settlement.

## Innovation

The project is not another AI chat wrapper and not another token dashboard. Its core design joins three usually separate concerns:

- evidence-grounded AI decision support;
- non-custodial crypto payment infrastructure;
- a BNB-native consumer and token layer.

The AI layer is designed to explain evidence and conflicts rather than hide them behind a single unexplained confidence score. The payment layer treats blockchain settlement as a verifiable state transition. The UQX layer demonstrates that the same ecosystem is already operating with real mainnet contracts.

## Security and trust model

- no user seed phrase or private key is required by the public services;
- merchant/customer payment funds are not custodied by the Paymaster;
- entitlement is not granted from a client-side button state;
- production secrets and database credentials are excluded from public repositories;
- the public repositories include disclosure-boundary documentation and credential guards;
- the UQX Presale forwards accepted stablecoin payments and records buyer allocation on-chain;
- UQX governance uses the documented timelock / Safe architecture.

Internal tests are not represented as a third-party audit.

## Current state

This submission represents a production system with live web services, BSC mainnet contracts and confirmed mainnet transaction activity. The public repositories are review surfaces for the parts that can be safely reproduced and inspected.

The next product milestones are broader adoption, continued security hardening, additional merchant integrations, deeper BNB-native wallet experiences and expansion of the intelligence workflows.

## Demo video

**TODO — replace after upload:** `DEMO_VIDEO_URL`

Recommended final video: 3–4 minutes, unlisted YouTube link, showing the actual product rather than an advertisement.

Suggested order:

1. Zynost live Decision Brief workflow;
2. BNB checkout / Zynost Pay path;
3. UQX app / wallet and presale surface;
4. BscScan real transaction proof;
5. public GitHub source and green CI;
6. closing architecture and roadmap.

## Presentation deck

Use the final BNB Hack pitch deck prepared from the same evidence. Do not introduce numbers or claims in the deck that are not represented here or in `HACKATHON_EVIDENCE.md`.

## Reviewer note

For the fastest technical review, start with [`HACKATHON_EVIDENCE.md`](HACKATHON_EVIDENCE.md). It separates public blockchain facts, production aggregate evidence and intentionally private implementation boundaries.
