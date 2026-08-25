# BNB Smart Chain Evidence Router

This page is intentionally a **routing/index page**, not a duplicate evidence store.

Zynost spans several public repositories with separate trust boundaries. Each class of on-chain evidence has one canonical home so reviewers do not need to compare repeated addresses or transaction lists across repositories.

## Canonical evidence ownership

### UQX token, presale, vesting and governance

Canonical repository:

https://github.com/umarae-dev/uqx-bnb-contracts-overview

Use:

- `DEPLOYMENTS.md` for deployed UQX contract addresses, funded pools and governance state;
- `ONCHAIN_EVIDENCE.md` for UQX presale purchase, configuration, deployment, governance-handoff and vesting-funding transaction proofs;
- `contracts/` and `test/uqx/` for production-safe Solidity source and production-derived tests.

No UQX contract address table or UQX transaction list is duplicated here.

### Zynost Pay production settlement

Canonical repository:

https://github.com/umarae-dev/zynost-gateway-backend-overview

Use `SETTLEMENT_EVIDENCE.md` for the public BSC subscription-settlement transaction proofs and the rest of that repository for the production-derived settlement-verification and merchant-order core.

No subscription transaction list is duplicated here.

### ERC-4337 gas sponsorship

Canonical repository:

https://github.com/umarae-dev/zynost-paymaster-overview

Use that repository for `ZynostVerifyingPaymaster.sol`, production Paymaster tests, deployment/maintenance scripts and ERC-4337 trust-boundary documentation.

### Browser checkout / wallet client

Canonical repository:

https://github.com/umarae-dev/zynost-pay-overview

Use that repository for the production-derived wallet bridge, transfer construction and gasless-signing client core.

## Why this page exists

`goro-app-overview` represents the Zynost client/application trust model. It should show **how the components connect**, not become a second copy of contract, settlement or Paymaster evidence owned by other repositories.

Reviewers should follow the canonical repository links above whenever they need exact addresses, hashes, contract source or settlement proof.

## Public source map

| Area | Canonical repository |
| --- | --- |
| Zynost decision intelligence | https://github.com/umarae-dev/tradeos-backend-overview |
| Zynost client trust/state | https://github.com/umarae-dev/goro-app-overview |
| Checkout/wallet client core | https://github.com/umarae-dev/zynost-pay-overview |
| Merchant orders + settlement | https://github.com/umarae-dev/zynost-gateway-backend-overview |
| ERC-4337 Paymaster | https://github.com/umarae-dev/zynost-paymaster-overview |
| UQX contracts + UQX on-chain evidence | https://github.com/umarae-dev/uqx-bnb-contracts-overview |
| UQX Android architecture | https://github.com/umarae-dev/uqx-app-overview |
| UQX backend architecture | https://github.com/umarae-dev/uqx-backend-overview |

## Verification principle

A reviewer should not need to decide which duplicated copy is authoritative. Exact evidence lives once, in the repository that owns the relevant subsystem; other repositories link to it.
