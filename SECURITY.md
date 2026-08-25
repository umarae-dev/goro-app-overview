# Security — Zynost Client Public Reference

This repository is intentionally separated from the private production Zynost client. It contains public documentation and a small runnable reference package that demonstrates safe client-side state boundaries without exposing production credentials, live service wiring, user data, private endpoints, or security-sensitive operational logic.

## Security boundary

The public reference assumes:

- authentication and entitlement decisions are enforced by a trusted backend;
- analysis jobs are server-owned and user-scoped;
- the client never treats editable local state as proof of payment, subscription entitlement, balance, or completed analysis;
- BNB checkout state is represented as a client state machine, while payment verification and sponsorship policy remain outside the public client reference;
- wallet or payment signatures must be user-approved and should never require a seed phrase or private key to leave the wallet;
- unavailable data is shown as unavailable rather than being silently replaced with fabricated success state.

## Never publish

Do not commit or paste any of the following into this repository, issues, pull requests, Actions logs, screenshots, or examples:

- `.env` files from production;
- access tokens, refresh tokens, session cookies, JWT signing secrets, OAuth client secrets;
- wallet private keys, seed phrases, mnemonics, keystore exports, signing credentials;
- merchant API keys or webhook signing secrets;
- database URLs, usernames, passwords, connection strings, backups, or dumps;
- private RPC credentials or provider API keys;
- production Firebase service-account material;
- customer or merchant PII;
- live admin endpoints or internal-only operational routes;
- fraud, abuse, rate-limit, or sponsorship thresholds whose disclosure would weaken production controls;
- internal runbooks, incident procedures, or unreleased security-sensitive features.

## Safe example values

Documentation and tests must use obvious non-production placeholders, for example:

```text
PUBLIC_API_BASE_URL=https://example.invalid
PUBLIC_BNB_RPC_URL=https://example.invalid
PUBLIC_WALLETCONNECT_PROJECT_ID=replace-with-your-own-public-id
```

Never replace placeholders with a credential copied from production.

## Wallet and payment boundary

This repository does not contain a standalone self-custody wallet engine. The production client integrates wallet connection and Zynost Pay flows, but key generation, key storage, production transaction policy, private API wiring, sponsorship policy, settlement verification, and merchant authentication are outside this public repository.

For BNB Chain payment infrastructure, see the separately scoped public repositories for Zynost Pay, Zynost Paymaster, and the Zynost Gateway API.

## Responsible disclosure

If you believe you found a security issue affecting a Zynost product, do not post exploit details, credentials, user data, or live attack instructions in a public issue.

Contact: **security@zynost.com**

Provide only the minimum information needed to reproduce the issue safely. Do not access funds, user data, merchant data, or systems beyond what you are explicitly authorized to test.
