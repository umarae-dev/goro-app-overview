# Production Lineage

Zynost and the wider UQX/Zynost Pay ecosystem were under active private production development before these public repositories were prepared.

The public repositories are **reviewable, production-safe publication surfaces**. Their public commit dates represent the date the safe public extraction/reference was published; they are not presented as the start date of the underlying product development.

No public history is backdated or rewritten to make the projects appear older than they are.

## Live product surfaces

- Zynost Intelligence: https://app.zynost.com
- Zynost website: https://zynost.com
- Zynost Pay: https://pay.zynost.com
- UQX presale: https://zynost.com/presale

## Repository lineage map

| Public repository | Relationship to private production system |
| --- | --- |
| `tradeos-backend-overview` | Runnable public intelligence reference containing production-derived patterns/modules plus independently packaged reference implementations. Exact proprietary production tuning, prompts, credentials and operations remain private. |
| `goro-app-overview` | Runnable Dart trust-state reference for the production Flutter client. It models production client invariants without publishing the full private Flutter application or live service wiring. |
| `zynost-pay-overview` | Production-derived browser client core. The repository documents the exact approved private-production files mirrored publicly and verifies their lineage in `PROVENANCE.md`. |
| `zynost-gateway-backend-overview` | Production-safe gateway core copied from the private production backend, including settlement, merchant-order, watch-only derivation and regression-test components documented in the repository. |
| `zynost-paymaster-overview` | Production-safe ERC-4337 Paymaster contract, tests and deployment/maintenance subset extracted from the live Zynost Pay stack. |
| `uqx-bnb-contracts-overview` | Production-safe UQX token, vesting and presale Solidity sources, production-derived tests/helpers, deployment utilities and public BSC deployment records. |
| `uqx-app-overview` | Public architecture/product overview of the private production Android application. Production Android source remains private. |
| `uqx-backend-overview` | Public architecture/security overview of the private UQX backend. Production backend source remains private. |

## Why the repositories are separated

The production ecosystem crosses several trust boundaries: AI/research services, a Flutter client, merchant checkout, settlement verification, ERC-4337 sponsorship, UQX contracts, a consumer Android app and account/reward services.

Publishing a raw production monorepo would unnecessarily expose credentials, operational configuration, customer data, private abuse controls and unrelated commercial implementation. Instead, each public repository exposes the portion that can be independently inspected, compiled or tested without weakening the live service.

## What production-derived means here

A public file is described as production-derived only when its repository provenance identifies that relationship. Depending on the repository, that can mean:

- an approved file copied directly from private production source;
- production tests/helpers published with secrets removed;
- a production-safe contract or deployment utility;
- or a clean public reference that reproduces a production architectural invariant without copying sensitive application wiring.

Those categories are deliberately not blurred together. A clean public reference is not described as a byte-for-byte production file.

## Public/private integrity rule

The public release must never include:

- real `.env` files;
- private keys, seed phrases or signing credentials;
- database URLs/passwords;
- merchant API keys or webhook secrets;
- private RPC/provider credentials;
- customer/user records;
- operational recovery runbooks;
- exact fraud, abuse, rate-limit or sponsorship thresholds where disclosure would weaken the production service.

Placeholder `.env.example` files are intentionally safe examples and must not contain live secret values.

## Evidence of real operation

The ecosystem has public BNB Smart Chain deployments and successful mainnet transactions documented in `ONCHAIN_EVIDENCE.md`. Production usage evidence is kept narrow and privacy-preserving: public transaction proofs are used where possible, while customer identities and private account records are not published.

## Commit-history interpretation

Public Git history should be read as the history of the **public extraction/open-source release**, not as a claim that the entire private commercial product was created on those dates.

This is intentional and more accurate than fabricating older commits or importing sensitive private history into a public repository.
