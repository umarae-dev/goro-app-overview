# Zynost — Decision Intelligence Client

> **The user-facing workspace for Zynost Intelligence — research, FlowState, historical context, alerts, portfolio workflows and non-custodial crypto checkout in one Flutter application.**

Zynost Client is the application traders use to interact with the broader Zynost ecosystem. It connects the evidence-first Zynost Intelligence backend to a cross-platform research interface and integrates Zynost Pay for subscription checkout.

**Live:** https://app.zynost.com  
**Client:** Flutter / Dart  
**Intelligence backend:** [Zynost Intelligence](https://github.com/umarae-dev/tradeos-backend-overview)  
**Payments:** [Zynost Pay](https://github.com/umarae-dev/zynost-pay-overview)

---

## Product architecture

```text
Trader
  │
  ▼
Zynost Flutter Client
  │
  ├────────────── Zynost Intelligence API
  │                    │
  │                    ├── Daily Market Read
  │                    ├── Full Scan
  │                    ├── FlowState
  │                    ├── Market Twin
  │                    ├── Decision Brief
  │                    └── Explain sessions
  │
  └────────────── Zynost Pay
                       │
                       ├── Hosted / native checkout flow
                       ├── BNB Smart Chain
                       └── ERC-4337 gasless payment path
```

The app is intentionally a client and orchestration surface. Market evidence, entitlement checks, credit accounting and decision intelligence remain server-side instead of being trusted to editable client state.

---

## Evidence-first intelligence in the app

The current product has moved beyond the older "ask many AI agents and average the answers" model.

The active backend first builds **12 deterministic evidence modules** and then derives higher-level decision layers such as:

- deterministic consensus;
- **FlowState** market regime;
- Flow Shift versus a previous scan;
- institutional lenses;
- anomaly detection;
- thesis confirmation / invalidation conditions;
- **Market Twin** historical analogues;
- optional AI Decision Brief;
- evidence-grounded follow-up explanation.

The Flutter client exposes these workflows through owner-scoped analysis runs rather than treating a generated paragraph as the source of truth.

---

## Daily Market Read

The app can start an authenticated Daily Market Read for a symbol and chosen horizon.

The client uses idempotency keys for analysis creation so retries and repeated taps do not have to become duplicate analysis jobs.

Runs are persisted server-side and polled by ID. If the client stops waiting before a long job finishes, the analysis remains attached to the user's history rather than disappearing with the screen state.

---

## Full Scan

Pro users can launch a deeper Full Scan that returns the institutional evidence layers maintained by the backend.

The client handles the run as a server-owned object with states such as queued, running, completed and failed.

A reserved credit is therefore tied to a real backend run instead of being deducted by a local UI counter.

---

## Decision Brief

Once a Full Scan exists, the user can request a language-specific Decision Brief.

The client does not send arbitrary market claims to the model. The backend prepares a bounded context from the stored evidence and returns a structured synthesis.

This preserves the product's core boundary:

> **numbers and evidence come from the data pipeline; AI explains the evidence.**

---

## Explain sessions

A completed analysis can become an evidence-grounded conversation.

The user can ask follow-up questions against the same source run, and the session remains linked to that analysis rather than starting a context-free chatbot conversation.

This makes the interface useful for questions such as:

- why did the regime change?;
- which evidence is weakening the thesis?;
- what would confirm the setup?;
- what is the largest risk in the current evidence?;
- how does the historical analogue distribution compare with the current thesis?

---

## FlowState alerts

The client can retrieve and acknowledge server-generated FlowState alerts.

This allows the product to surface a material regime change rather than requiring the user to manually compare two long reports.

Alert state is owner-scoped and stored server-side.

---

## Research workspace

The application includes a broad crypto research surface around the core intelligence workflow.

Current private client code contains dedicated screens for capabilities including:

- **Market Radar**;
- **Advanced Chart**;
- **Order-Book Radar**;
- **On-chain research**;
- **News Intelligence**;
- **Watchlist and alerts**;
- **Portfolio workflows**;
- **Payment history / billing**;
- **Admin and account-support surfaces**.

These tools are designed to give the trader context around a decision rather than forcing every action into one overloaded dashboard.

---

## Pricing model

Current client pricing presents three tiers:

| Plan | Current client price | Intelligence access |
|---|---:|---|
| **Free** | $0 | Daily Market Reads and core market research |
| **Pro** | $12.99/month | 250 monthly analyses, Full Scan and premium intelligence layers |
| **Pro Plus** | $16.99/month | 350 monthly analyses and higher daily usage limits |

Yearly billing is also supported in the current client.

The product keeps ordinary market browsing separate from expensive premium analysis so every screen open does not consume an AI/research credit.

---

## Zynost Pay integration

Subscriptions use Zynost's own non-custodial payment stack rather than embedding wallet custody inside the intelligence client.

The client connects to the separate gateway for checkout and gasless-payment operations.

### BNB gasless flow

For supported BNB Smart Chain checkout, the application can interact with the Zynost Pay gasless endpoints to:

1. initialize the order-scoped smart-account flow;
2. query smart-account funding status;
3. prepare the exact sponsored operation;
4. submit the customer's signed operation.

The merchant API credential is not required in the browser-facing gasless flow; these endpoints are scoped to the individual gateway order.

```text
Zynost subscription
       │
       ▼
Zynost Pay order
       │
       ▼
Customer wallet / smart account
       │
       ▼
ERC-4337 sponsored BNB settlement
       │
       ▼
Subscription confirmation
```

---

## Important wallet boundary

This repository describes the **Zynost Intelligence client**.

The current `goro_app` repository contains checkout wallet-connect / gasless-payment integration, but it is **not being represented here as the full standalone Zynost self-custody wallet engine**.

Any dedicated self-custody wallet product should have its own architecture/security overview once its source repository is identified and reviewed.

This distinction prevents the public documentation from claiming custody/key-management capabilities that are not implemented inside this specific codebase.

---

## Authentication and account security

The client integrates with server-side authentication features including:

- email signup/login;
- email verification;
- password reset;
- Google/Facebook authentication flows;
- TOTP two-factor authentication;
- backup-code support;
- server-side entitlement checks;
- account/session validation.

Sensitive plan gates and analysis entitlements are enforced by the backend rather than relying on hiding buttons in Flutter.

See [`SECURITY.md`](SECURITY.md) for the public client-security boundary.

---

## Cross-platform design

The application is written in Flutter so the same product system can target multiple client environments while preserving one shared product language.

The private codebase includes responsive interfaces for research, billing, checkout and account-management flows, including light/dark presentation.

---

## Relationship to the broader ecosystem

```text
                Zynost Intelligence
                       │
                       ▼
                 Zynost Client
                  /          \
                 /            \
        Research UI          Zynost Pay
                                │
                                ▼
                          Zynost Paymaster
                                │
                                ▼
                         BNB Smart Chain

                 UQX ecosystem
                       │
                       └── separate BNB-native community/token layer
```

The Zynost ecosystem deliberately separates research, payment infrastructure and token/community functionality instead of placing every trust boundary inside one application process.

---

## Technology

Flutter · Dart · HTTP APIs · Firebase messaging · local notifications · QR rendering · web/native responsive UI · Zynost Intelligence API · Zynost Pay API

---

## Production vs. public repository boundary

This repository is a **public product and architecture overview**, not the production Flutter source tree.

### Public here

- client/product architecture;
- intelligence workflow;
- evidence-first positioning;
- BNB checkout integration model;
- account-security capabilities;
- product boundaries;
- relationship to other Zynost components.

### Kept private

- production Flutter source;
- authentication implementation details not required for public review;
- API wiring and internal application state;
- user data;
- production configuration;
- provider credentials;
- anti-abuse implementation;
- private product experiments and unreleased features.

No access token, API secret, seed phrase, private key or user-private information should ever be committed to this repository.

---

## Open-source / BNB developer track

This commercial client remains private. Zynost's hackathon/open-source work should live in a separately scoped BNB developer repository that can be safely reproduced without publishing the complete production client or backend.

This overview will link to that repository once the BNB component is ready.

---

## Status

**Active production development.**

The current private client integrates the evidence-first intelligence API, persisted analysis runs, Decision Briefs, Explain sessions, FlowState alerts, subscription checkout and BNB gasless-payment flows.
