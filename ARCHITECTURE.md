# Zynost Client Architecture

Zynost Client is the user-facing application for Zynost Intelligence and subscription access. The private production client is Flutter-based; this public repository publishes a compact reference for the trust boundaries that are useful to reviewers.

```text
User
  │
  ▼
Zynost Client
  │
  ├── research / decision-intelligence requests
  │        │
  │        ▼
  │   Zynost Intelligence backend
  │        ├── source-backed evidence
  │        ├── deterministic intelligence layers
  │        └── optional synthesis
  │
  └── subscription checkout
           │
           ▼
       Zynost Pay
           │
           ├── direct supported settlement path
           └── supported sponsored path
                    │
                    ▼
             blockchain settlement
```

## Intelligence boundary

The client does not calculate market measurements locally and does not treat a fixed count of AI agents as the product architecture. Completed analysis objects come from the server-owned decision-intelligence pipeline, where evidence and deterministic market state are formed before optional user-facing synthesis.

The client is not authoritative for:

- provider-derived market measurements;
- analysis ownership/completion;
- premium credit accounting;
- payment confirmation;
- subscription entitlement;
- merchant settlement;
- gas-sponsorship policy;
- chain settlement verification.

## Public reference rules

`lib/zynost_client_reference.dart` demonstrates three trust rules:

1. an analysis result is renderable only after ownership and completion are established;
2. checkout follows an explicit state machine rather than jumping from button tap to success;
3. entitlement is granted only after backend-confirmed settlement.

The example intentionally contains no production credential, wallet secret, merchant secret, private RPC credential or signing key.

## UQX boundary

UQX is a separate self-custody Web3 wallet product. The native UQX Android application owns its device-side wallet trust boundary; Zynost Client does not need or receive the UQX recovery phrase/private key in order to request intelligence or subscription state.

```text
UQX Android wallet
  ├── device-owned BIP39/EVM credentials
  └── supported BNB Smart Chain state

Zynost Client
  ├── decision-intelligence UX
  └── subscription UX
```

Older mining/reward/referral terminology in legacy UQX services should not be copied into current Zynost Client branding.

## Related public repositories

- `tradeos-backend-overview` — Zynost decision-intelligence architecture;
- `zynost-pay-overview` — payment client reference;
- `zynost-paymaster-overview` — ERC-4337 sponsorship controls;
- `zynost-gateway-backend-overview` — merchant orders and settlement verification;
- `uqx-app-overview` — UQX self-custody Android wallet architecture;
- `uqx-bnb-contracts-overview` — UQX BNB Smart Chain contracts and deployment evidence.

## Why the production Flutter tree is private

The full client contains authentication wiring, operational configuration, unreleased product work and other implementation details unnecessary for public review. The public repository demonstrates architecture and testable invariants without presenting itself as a byte-for-byte mirror of the commercial application.
