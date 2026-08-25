# Provenance

This repository was created after the private Zynost Flutter client was already under active production development.

It is not a raw mirror of that private repository and it does not backdate public history to make the open-source work appear older than it is.

## Production-derived facts

The public documentation is based on reviewed behavior from the private client, including:

- Flutter/Dart as the client stack;
- server-owned analysis runs and entitlements;
- Zynost Pay checkout integration;
- a BNB Smart Chain payment path;
- wallet-connect and gasless checkout support in the private application;
- separate Zynost Intelligence and Zynost Pay services.

## Public-only code

The Dart code in this repository is a purpose-built public reference. It was written to make the client trust model independently runnable and testable without copying live API wiring or security-sensitive production implementation.

Public-only material includes:

- `lib/zynost_client_reference.dart`;
- tests and runnable example;
- CI and public-source leak guard;
- `.env.example` placeholders;
- architecture, security, release and contribution documentation.

## Intentionally private

The following remain outside this repository:

- the complete production Flutter source tree;
- authentication/session implementation details;
- real service URLs where disclosure is unnecessary;
- credentials, tokens and provider configuration;
- merchant secrets and webhook signing material;
- private RPC/provider configuration;
- anti-abuse and sponsorship policy internals;
- user/customer/merchant data;
- unreleased product code;
- operational infrastructure and runbooks.

This separation lets reviewers inspect a real architectural invariant without turning the public repository into an accidental production disclosure channel.
