# BNB Smart Chain On-Chain Evidence

This page records public BNB Smart Chain evidence for the live Zynost/UQX ecosystem. It is intentionally product-neutral documentation rather than event-specific marketing material.

## Network

- BNB Smart Chain mainnet
- Chain ID: `56`

## Deployed components

| Component | Address | Role |
| --- | --- | --- |
| UQX Token | `0x68B1Eb4b344cc86750bd9Ac9e3f4F53B3aF48A28` | Fixed-supply UQX token |
| UQX Vesting | `0xB3d0CD3c7a73F20689223AdF6223F53A8C245326` | Reward / vesting pool |
| UQX Presale | `0xe2f3931Be4A5e1f7C8266C3312C015E426f625dD` | Stablecoin purchase and buyer allocation |
| TimelockController | `0x9dE032505A10F8A9d4D9445A0cEa9bF49320F569` | Delayed governance control |
| Safe multisig | `0x7E7bAf58129dc3e1992ef2cAfbD981391D522C97` | Governance proposer |
| Zynost Verifying Paymaster | `0x5a7593436ddd1211ce68958aedfb3864ef3f2848` | ERC-4337 gas sponsorship |
| ERC-4337 EntryPoint v0.6 | `0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789` | Shared account-abstraction EntryPoint |

The UQX contracts were deployed on 18 August 2026. Public deployment details and source live in `uqx-bnb-contracts-overview`.

## Successful mainnet transaction evidence

### UQX presale purchase

Transaction:

`0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238`

Explorer:

https://bscscan.com/tx/0xc8577b9043c1c8f1c8e89907c80a238d080afea114af050c83b86453b04e0238

Recorded facts:

- status: success;
- block: `116626859`;
- time: `2026-08-18 08:47:31 UTC`;
- call: UQX Presale `buy(address,uint256)`;
- payment asset: BSC USDT `0x55d398326f99059ff775485246999027b3197955`;
- paid: **1 USDT**;
- allocation: **200 UQX**.

### Presale payment-token activation

Transaction:

`0x2968e14c1781b94e32aa1715dd38486001417c8400b1fe1453d9917bfafc599a`

Explorer:

https://bscscan.com/tx/0x2968e14c1781b94e32aa1715dd38486001417c8400b1fe1453d9917bfafc599a

A second successful payment-token configuration transaction is visible at:

`0x99c073cd0ac057a03ae0d9582dca95da60436b5eb659bdfe376cbb1df243590c`

Explorer:

https://bscscan.com/tx/0x99c073cd0ac057a03ae0d9582dca95da60436b5eb659bdfe376cbb1df243590c

### Presale deployment

Transaction:

`0x5d781e7aa9e7b4b26beac140b36f0a524b9c100f9dd0a3a29da01b17b5a83e93`

Explorer:

https://bscscan.com/tx/0x5d781e7aa9e7b4b26beac140b36f0a524b9c100f9dd0a3a29da01b17b5a83e93

### Governance handoff

Transaction:

`0xa60cd2c97f6944a5b64b7a40bc2aee0dc20754bdb343597a1698356a224e3a17`

Explorer:

https://bscscan.com/tx/0xa60cd2c97f6944a5b64b7a40bc2aee0dc20754bdb343597a1698356a224e3a17

### UQX reward-vesting funding

Transaction:

`0xd7b7d5bc4d927e4df29fe56a079deada0ac560505990d24e6ddd112048caf5cf`

Explorer:

https://bscscan.com/tx/0xd7b7d5bc4d927e4df29fe56a079deada0ac560505990d24e6ddd112048caf5cf

Recorded facts include successful funding of the deployed UQX Vesting pool.

## Real Zynost subscription settlement on BSC

Production billing records show completed subscription invoices settled with USDT on BNB Smart Chain. Two payments were independently matched to their public transfers without publishing customer identities.

### Subscription payment A

`0x2756bce009233683be9fd9f9828df27f4c2599c7070a4423c8bbe8d7c0e65a21`

- amount: **3.01 USDT**
- status: success
- BSC mainnet

Explorer:

https://bscscan.com/tx/0x2756bce009233683be9fd9f9828df27f4c2599c7070a4423c8bbe8d7c0e65a21

### Subscription payment B

`0x5a5581669cb039e203a8a9a941bc52cd88adaad55cfcd093cc20816f0d96f208`

- amount: **3.00 USDT**
- status: success
- BSC mainnet

Explorer:

https://bscscan.com/tx/0x5a5581669cb039e203a8a9a941bc52cd88adaad55cfcd093cc20816f0d96f208

## Public source map

| Repository | Publicly reviewable material |
| --- | --- |
| https://github.com/umarae-dev/tradeos-backend-overview | Intelligence architecture and runnable evidence reference |
| https://github.com/umarae-dev/goro-app-overview | Client trust-state reference and ecosystem documentation |
| https://github.com/umarae-dev/zynost-pay-overview | Production-derived wallet / checkout client core |
| https://github.com/umarae-dev/zynost-gateway-backend-overview | Production-safe merchant order and settlement core |
| https://github.com/umarae-dev/zynost-paymaster-overview | ERC-4337 Paymaster contract, tests and scripts |
| https://github.com/umarae-dev/uqx-bnb-contracts-overview | UQX token, presale, vesting contracts and deployment records |
| https://github.com/umarae-dev/uqx-app-overview | UQX Android product / wallet architecture overview |
| https://github.com/umarae-dev/uqx-backend-overview | UQX backend accounting/security architecture overview |

## Privacy and verification boundary

This file intentionally contains only public chain data and privacy-safe aggregate production evidence. It does not include customer emails, wallet ownership mappings, private API records, production credentials, seed phrases, private keys or operational security controls.

Anyone reviewing these claims should independently open the public transaction hashes and deployed addresses in a BNB Smart Chain explorer before relying on them.
