# Security — Zynost Client Overview

This repository is a public architecture overview. It intentionally does not contain the production Flutter application source, private backend logic, user data, access tokens, API credentials, wallet secrets or infrastructure credentials.

## Public security principles

The client is designed around several boundaries:

- authentication and entitlement checks are enforced server-side;
- analysis runs are owner-scoped on the backend;
- expensive/premium actions use backend-controlled usage and credit accounting;
- 2FA-protected sessions require a second factor before a full access token is issued;
- password-recovery and email-verification flows avoid exposing unnecessary account-existence information;
- browser-facing BNB gasless checkout calls are scoped to a specific payment order rather than shipping a merchant API credential to the browser;
- research calculations and stored evidence remain backend-owned rather than trusting editable client state.

## What must never be published

Do not commit or disclose:

- access or refresh tokens;
- private keys or seed phrases;
- API provider credentials;
- database credentials;
- production environment files;
- private user information;
- internal anti-abuse rules where disclosure would materially weaken controls;
- unreleased security-sensitive implementation details.

## Wallet boundary

The private `goro_app` codebase contains wallet-connect and gasless-checkout integration. This public repository does not claim that `goro_app` itself is the complete standalone self-custody wallet/key-management engine.

Any dedicated wallet repository should undergo a separate review covering key generation, key storage, signing, chain configuration, transaction simulation, backup/recovery and threat modeling before its security architecture is documented publicly.

## Reporting

If you believe you have discovered a security issue in a Zynost product, do not publish exploit details or secrets in a public GitHub issue. Contact the project privately and provide the minimum reproduction information required to investigate.
