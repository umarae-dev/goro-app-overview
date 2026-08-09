# Zynost — Client App

**Trade with a real edge.**

This is the app traders actually use — one Flutter codebase shipping to web, Android, iOS, and desktop, built on top of Zynost's multi-agent analysis backend.

**Live:** https://app.zynost.com

## What's actually in it

- **Market Radar** — a single view merging system-generated scans, emerging setups, a trader's own saved plans, early-activity alerts, and the live track record, so "what is the system seeing right now" has one answer instead of five tabs.
- **Screener** — live gainers, losers, and volume movers, pulled directly from exchange data with an honest error state if an exchange is unreachable rather than a silently stale list.
- **Trade Dashboard** — the main analysis hub: pick a coin, run the full agent panel, get the Skeptic-checked, Judge-synthesized verdict.
- **Trade Plan** — an annotated chart with entry, stop, and target zones narrated in plain language, with one-tap actions to add it to a portfolio, set an alert, or log the trade, plus live buy-links to real exchanges.
- **On-Chain** — a multi-chain snapshot linking out to real block explorers per chain, not a black-box summary.
- **Order-Book Radar** — depth and imbalance visualization.
- **News Intelligence** — a live aggregated headline feed, tagged to specific coins only when a coin genuinely appears in the story.
- **Watchlist & Alerts** — starred coins with live prices, and price alerts evaluated against real-time data.
- **Portfolio** — real holdings tracking backed by the same agent panel, not a static spreadsheet view.
- **Reports** — a running feed of past verdicts per coin.
- **Advanced Chart** — a full TradingView-based chart per symbol.

Underneath the trading features sits a full account system: email verification, two-factor authentication, password recovery with deep-linked reset flows, billing and plan management, self-service refund requests (every refund is a manual on-chain send reviewed by a human, never an automated payout), and an admin dashboard for account and dispute review.

## Pricing

Free comes with 3 lifetime analysis credits — no monthly refresh, meant purely to let someone try the real thing before paying. Pro is $12.99/month for 250 credits (250/year at a discount), with an 8-per-day cap. Pro Plus is $16.99/month for 350 credits, 12 per day. One credit runs one full multi-agent analysis — all eleven specialist agents plus the free Skeptic/Judge verdict pass. Higher-tier-only features (system-generated trade plans, early-activity alerts) are gated independently of credit balance, and every check is enforced server-side.

## How payment works

Checkout runs through [Zynost Pay](https://github.com/umarae-dev/zynost-pay-overview), Zynost's own non-custodial gateway — a unique deposit address per invoice, confirmed by the backend watching the chain directly, no third-party custodian in the loop. For customers without gas on hand, a gasless path lets a connected wallet sign a real transaction that Zynost sponsors, through an ERC-4337 smart account derived from the user's own wallet signature — the platform never holds a spendable key at any point.

## Stack

Flutter (Dart) — a single codebase targeting web, Android, iOS, and desktop · deployed on Vercel (web)

## Status

In active production use by real, paying users.

---

This repository is a public overview of a closed-source production application. Source code isn't published here — the same practice most consumer fintech apps follow to protect their client-side business logic and integration details.
