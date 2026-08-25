# Public / Private Boundary

This repository is a deliberately scoped public reference for the Zynost client.

## Public here

- high-level Zynost client architecture;
- BNB checkout state transitions;
- server-authoritative entitlement and analysis ownership rules;
- a runnable Dart reference with tests;
- generic `.env.example` placeholders;
- public CI and credential-leak guard;
- security, provenance, contribution and release documentation.

## Private in production

- the full Flutter UI and application source;
- production authentication/session wiring;
- live API configuration not needed for public review;
- access/refresh tokens and OAuth secrets;
- merchant API keys and webhook secrets;
- private RPC/provider credentials;
- wallet private material or recovery phrases;
- production Firebase/server credentials;
- user, merchant and customer data;
- admin-only operational routes;
- exact anti-abuse, fraud, rate-limit and sponsorship thresholds;
- incident runbooks, monitoring internals and unreleased features.

## Rule for future public contributions

A file should be copied from production only when all of the following are true:

1. it is genuinely useful for independent public evaluation;
2. it contains no secret, credential, user data or unnecessary operational detail;
3. publishing it does not materially weaken an abuse, fraud, payment or authentication control;
4. it is manually reviewed in addition to passing automated secret scanning;
5. its provenance is documented honestly.

When there is doubt, keep the production file private and write a clean public reference instead.
