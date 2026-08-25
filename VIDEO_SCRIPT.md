# Demo Video Recording Guide

This is a recording guide, not an advertisement script. The goal is to let a judge verify a live system in a few minutes.

Target length: **3–4 minutes**.  
Recommended upload: **YouTube, Unlisted**.

## 0:00–0:20 — What this is

Show the Zynost landing/product screen and move directly into the live application.

Voice-over:

> Zynost is a live crypto decision-intelligence ecosystem connected to BNB Smart Chain. This demo shows the production research workflow, real BSC payments, the UQX on-chain layer, and the public source a reviewer can run.

On screen, keep one simple line visible if you add editing text:

**Decision Intelligence → Non-custodial Payment → BNB-native Economy**

## 0:20–1:05 — Zynost Intelligence

Open the real Zynost workspace. Run or open a genuine analysis and show the path from evidence to a Decision Brief.

Prioritize screens that demonstrate:

- market evidence;
- conflicting evidence / risk;
- consensus or FlowState;
- the final Decision Brief;
- explanation rather than an unexplained signal.

Voice-over:

> Crypto traders already have charts, news, order books and on-chain data. The problem is turning conflicting evidence into a decision. Zynost organizes the evidence and produces an explainable Decision Brief. It does not auto-trade; the final decision stays with the user.

Do not spend time scrolling every feature.

## 1:05–1:40 — Zynost Pay on BNB Smart Chain

Open the real checkout path. Show BNB Smart Chain as a payment network and briefly show wallet / payment state.

If recording a new payment is inconvenient, show the checkout and then open these already-confirmed production BSC transactions:

- `0x2756bce009233683be9fd9f9828df27f4c2599c7070a4423c8bbe8d7c0e65a21` — 3.01 USDT;
- `0x5a5581669cb039e203a8a9a941bc52cd88adaad55cfcd093cc20816f0d96f208` — 3.00 USDT.

Voice-over:

> Paid access is settled non-custodially. These are real production subscription payments in USDT on BNB Smart Chain, not test transactions created for the video. Zynost also has an ERC-4337 Paymaster layer for sponsored-gas flows.

Never show a private key, seed phrase, API key, admin token, internal customer record, or production environment screen.

## 1:40–2:20 — UQX on-chain layer

Show the UQX consumer app / wallet surface and then the live presale page.

Open the production Presale contract:

`0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD`

Then open the real purchase transaction:

`0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238`

Point out only the useful proof:

- success;
- BSC mainnet;
- Presale contract interaction;
- 1 USDT payment;
- 200 UQX allocation.

Voice-over:

> UQX is the BNB-native consumer layer. The token, vesting and presale contracts are live on BSC mainnet. This transaction is a real presale purchase: one USDT paid and two hundred UQX allocated by the contract.

If showing the mining/reward screen, describe it accurately as an **engagement reward mechanism**, not proof-of-work mining.

## 2:20–2:55 — Governance and infrastructure

Briefly show the public deployment page or BscScan addresses:

- UQX Token: `0x68B1Eb4b344cc86750bd9Ac9e3f4F53B3aF48A28`
- UQX Vesting: `0xB3d0CD3c7a73F20689223AdF6223F53A8C245326`
- UQX Presale: `0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD`
- Timelock: `0x9dE032505A10F8A9d4D9445A0cEa9bF49320F569`
- Zynost Paymaster: `0x5a7593436ddd1211ce68958aedfb3864ef3f2848`

Voice-over:

> The BNB integration includes the UQX token, presale, vesting, delayed governance and an ERC-4337 Verifying Paymaster. The reusable contracts and reference components are published separately so reviewers can inspect each trust boundary.

## 2:55–3:30 — Open source and CI

Open GitHub and show these repositories quickly:

- `tradeos-backend-overview`
- `goro-app-overview`
- `zynost-pay-overview`
- `zynost-gateway-backend-overview`
- `zynost-paymaster-overview`
- `uqx-bnb-contracts-overview`

Show at least one green Actions run and the actual Solidity contract/tests.

Voice-over:

> These are the public review surfaces. They include runnable references, production-safe contract source, tests, security boundaries and CI. Commercial credentials and customer data stay private, and we do not represent private product source as open source.

## 3:30–3:50 — Close

Finish on a simple architecture view or the product home screen.

Voice-over:

> We are not submitting an idea for what might run on BNB Chain. We are submitting a live ecosystem with real BSC contracts, real settlement and public components that other builders can inspect and run.

## Recording checklist

Before uploading, verify that the recording contains **none** of these:

- seed phrase / private key;
- wallet recovery screen;
- `.env` contents;
- API or merchant keys;
- database connection strings;
- customer email, user ID or private wallet history;
- server terminal showing secrets;
- admin-only security or anti-abuse controls.

Keep BscScan transaction hashes readable long enough for a reviewer to pause and verify them.
