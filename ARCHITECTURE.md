# Architecture

Zynost Client is the user-facing application in the wider Zynost stack. The private production app is Flutter-based. This public repository exposes only a small, dependency-light reference for the trust boundaries that matter to reviewers.

```text
User
  │
  ▼
Zynost Client
  │
  ├── research / analysis requests
  │        │
  │        ▼
  │   Zynost Intelligence backend
  │        └── server-owned evidence, runs and entitlements
  │
  └── subscription checkout
           │
           ▼
       Zynost Pay
           │
           ├── direct stablecoin settlement
           └── ERC-4337 sponsored path
                    │
                    ▼
             BNB Smart Chain
```

## Client trust rules

The client is not authoritative for:

- payment confirmation;
- subscription entitlement;
- analysis ownership;
- premium credit accounting;
- merchant settlement;
- gas sponsorship policy;
- chain settlement verification.

Those decisions stay server-side or on-chain.

## Public reference

`lib/zynost_client_reference.dart` demonstrates three small rules used throughout the product architecture:

1. an analysis result is renderable only after ownership and completion are established;
2. checkout follows an explicit state machine rather than jumping from a button tap directly to success;
3. entitlement is granted only after backend-confirmed settlement.

The example intentionally contains no HTTP client, production hostname, API route, wallet credential, merchant secret, RPC credential, or signing implementation.

## BNB Chain role

BNB Smart Chain is the primary chain demonstrated by the payment path. The public reference recognizes chain ID `56` and models the user-visible checkout lifecycle. Actual wallet connection, signature transport, sponsorship policy, settlement verification and merchant callbacks are implemented in separately scoped production services and are not duplicated here.

Related public repositories:

- `zynost-pay-overview` — browser payment client core;
- `zynost-paymaster-overview` — ERC-4337 sponsorship contracts and controls;
- `zynost-gateway-backend-overview` — merchant orders and settlement verification;
- `uqx-bnb-contracts-overview` — BNB-native UQX contracts.

## Why the production Flutter tree is private

The full client contains authentication wiring, operational configuration, unreleased product work and other implementation details that are unnecessary for judging this public component and would expand the attack surface if copied indiscriminately.

The public repository therefore demonstrates architecture and testable invariants without pretending to be a byte-for-byte mirror of the commercial application.
