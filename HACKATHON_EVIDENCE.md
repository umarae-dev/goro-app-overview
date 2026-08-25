# BNB Hackathon Evidence

This page is the shortest path for a reviewer who wants to verify what is live, what is open source, and what actually happened on BNB Smart Chain.

Zynost is not being presented as a weekend prototype. The production ecosystem combines crypto decision intelligence, non-custodial checkout, ERC-4337 gas sponsorship, and the BNB-native UQX token layer. Commercial application internals remain private, while the reusable BNB-facing components and review references are published in separate repositories with explicit provenance and security boundaries.

## Product path

```text
Market data and evidence
        |
        v
Zynost Intelligence
        |
        | Decision Brief
        v
Zynost client
        |
        v
Zynost Pay ---------------------> BNB Smart Chain
        |                              |
        | direct stablecoin payment    | UQX token / presale / vesting
        | ERC-4337 sponsored path      |
        v                              v
merchant / subscription access   BNB-native ecosystem layer
```

Live product surfaces:

- Zynost Intelligence: https://app.zynost.com
- Zynost website: https://zynost.com
- UQX presale: https://zynost.com/presale

## BNB Smart Chain deployments

Network: **BNB Smart Chain mainnet (chain ID 56)**

| Component | Address | Role |
| --- | --- | --- |
| UQX Token | `0x68B1Eb4b344cc86750bd9Ac9e3f4F53B3aF48A28` | Fixed-supply UQX token |
| UQX Vesting | `0xB3d0CD3c7a73F20689223AdF6223F53A8C245326` | Reward / vesting pool |
| UQX Presale | `0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD` | On-chain stablecoin purchase and allocation |
| TimelockController | `0x9dE032505A10F8A9d4D9445A0cEa9bF49320F569` | Delayed governance control |
| Safe multisig | `0x7E7bAf58129dc3e1992ef2cAfbD981391D522C97` | Governance proposer |
| Zynost Verifying Paymaster | `0x5a7593436ddd1211ce68958aedfb3864ef3f2848` | ERC-4337 gas sponsorship |
| ERC-4337 EntryPoint v0.6 | `0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789` | Shared account-abstraction EntryPoint |

The UQX contracts were deployed on 18 August 2026. The public contracts repository records the deployment and funded pools without publishing deployment credentials.

## Mainnet transaction evidence

These hashes are public blockchain evidence. They were independently re-checked against BNB Smart Chain RPC before being added here.

### 1. Real UQX presale purchase

Transaction:

`0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238`

Explorer: https://bscscan.com/tx/0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238

Verified facts:

- status: success;
- block: `116626859`;
- time: `2026-08-18 08:47:31 UTC`;
- call: UQX Presale `buy(address,uint256)`;
- payment asset: BSC USDT (`0x55d398326f99059ff775485246999027b3197955`);
- paid: **1 USDT**;
- allocation emitted by the contract: **200 UQX**.

The public `UqxPresale.sol` source emits `Purchased(buyer, paymentToken, paidAmount, uqxAmount)` and records each buyer's allocation on-chain.

### 2. Presale payment-token activation

Transaction:

`0x2968e14c1781b94e32aa1715dd38486001417c8400b1fe1453d9917bfafc599a`

Explorer: https://bscscan.com/tx/0x2968e14c1781b94e32aa1715dd38486001417c8400b1fe1453d9917bfafc599a

Verified facts:

- status: success;
- block: `116614906`;
- direct interaction with the deployed UQX Presale contract;
- call selector matches the presale payment-token configuration function.

A second successful payment-token configuration transaction is also visible at:

`0x99c073cd0ac057a03ae0d9582dca95da60436b5eb659bdfe376cbb1df243590c`

Explorer: https://bscscan.com/tx/0x99c073cd0ac057a03ae0d9582dca95da60436b5eb659bdfe376cbb1df243590c

### 3. Presale deployment and governance handoff

Deployment transaction:

`0x5d781e7aa9e7b4b26beac140b36f0a524b9c100f9dd0a3a29da01b17b5a83e93`

Explorer: https://bscscan.com/tx/0x5d781e7aa9e7b4b26beac140b36f0a524b9c100f9dd0a3a29da01b17b5a83e93

- status: success;
- deployment block: `116614880`.

Ownership-transfer transaction:

`0xa60cd2c97f6944a5b64b7a40bc2aee0dc20754bdb343597a1698356a224e3a17`

Explorer: https://bscscan.com/tx/0xa60cd2c97f6944a5b64b7a40bc2aee0dc20754bdb343597a1698356a224e3a17

- status: success;
- block: `116614934`;
- call: `transferOwnership(address)` to the governance architecture.

### 4. UQX reward-vesting pool funding

Transaction:

`0xd7b7d5bc4d927e4df29fe56a079deada0ac560505990d24e6ddd112048caf5cf`

Explorer: https://bscscan.com/tx/0xd7b7d5bc4d927e4df29fe56a079deada0ac560505990d24e6ddd112048caf5cf

- status: success;
- block: `116634649`;
- time: `2026-08-18 09:45:57 UTC`;
- funds the deployed UQX Vesting pool as documented in the public deployment record.

## Real Zynost subscription payments on BSC

Production billing records were reviewed only in aggregate and without exporting customer identities, emails, wallet addresses, or other private account data.

The production billing database currently records **3 completed Zynost subscription invoices paid on BSC in USDT**. Two of those payments were independently matched to their public BSC USDT transfer transactions:

### Subscription payment A

`0x2756bce009233683be9fd9f9828df27f4c2599c7070a4423c8bbe8d7c0e65a21`

Explorer: https://bscscan.com/tx/0x2756bce009233683be9fd9f9828df27f4c2599c7070a4423c8bbe8d7c0e65a21

- status: success;
- block: `112858068`;
- time: `2026-07-29 17:29:20 UTC`;
- asset: USDT on BSC;
- amount: **3.01 USDT**.

### Subscription payment B

`0x5a5581669cb039e203a8a9a941bc52cd88adaad55cfcd093cc20816f0d96f208`

Explorer: https://bscscan.com/tx/0x5a5581669cb039e203a8a9a941bc52cd88adaad55cfcd093cc20816f0d96f208

- status: success;
- block: `112863660`;
- time: `2026-07-29 18:11:16 UTC`;
- asset: USDT on BSC;
- amount: **3.00 USDT**.

The third completed invoice is intentionally not assigned a transaction hash here because the historical record was not independently matched with enough confidence during this review. We would rather leave one proof out than guess.

## Public source map

The public repositories are divided by system boundary so a reviewer can inspect a focused implementation rather than a sanitized production dump.

| Repository | What a reviewer can inspect |
| --- | --- |
| https://github.com/umarae-dev/tradeos-backend-overview | Zynost intelligence / evidence architecture |
| https://github.com/umarae-dev/goro-app-overview | Runnable client trust-state reference and submission hub |
| https://github.com/umarae-dev/zynost-pay-overview | Production-derived wallet and gasless checkout client core |
| https://github.com/umarae-dev/zynost-gateway-backend-overview | Merchant order and settlement-verification reference |
| https://github.com/umarae-dev/zynost-paymaster-overview | Production-safe ERC-4337 Paymaster contract, scripts and tests |
| https://github.com/umarae-dev/uqx-bnb-contracts-overview | UQX token, presale and vesting contracts plus deployments |

Two additional UQX application/backend overview repositories exist but are still being updated alongside production work. They are not needed to verify the on-chain evidence above.

## What is deliberately not public

The submission does not publish:

- private keys, seed phrases or signing credentials;
- production `.env` files or private RPC credentials;
- database URLs or passwords;
- merchant API keys or webhook secrets;
- customer or user records;
- exact fraud, anti-abuse, rate-limit or sponsorship thresholds;
- admin-only operational routes and recovery runbooks;
- unreleased commercial source that is not required to reproduce the public reference components.

This boundary is documented openly in the individual repositories. Public code should be evaluated as public code; private commercial components are not represented as open source.

## Fast reviewer checklist

1. Open the UQX Presale contract on BscScan.
2. Open transaction `0xc857...e0238` and confirm the successful mainnet presale call.
3. Inspect `UqxPresale.sol` in the public UQX contracts repository.
4. Open the two Zynost subscription USDT transactions above.
5. Clone the public repositories and run their documented tests / examples.
6. Check GitHub Actions for the latest green CI runs.
7. Review each repository's provenance, security, and public/private-boundary documentation.

No production credential is required for any of those review steps.
