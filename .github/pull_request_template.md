## What changed

Describe the public-facing change and why it belongs in this repository.

## Verification

- [ ] `dart pub get`
- [ ] `dart format --output=none --set-exit-if-changed lib test example`
- [ ] `dart analyze`
- [ ] `dart test`
- [ ] `node scripts/check-public-repo.mjs`

## Public-source safety

- [ ] No production `.env` or credential file is included.
- [ ] No token, cookie, OAuth secret, database credential, merchant secret, wallet private material, RPC credential, or service-account material is included.
- [ ] No customer, merchant, or user-private data is included.
- [ ] No internal abuse, fraud, sponsorship, admin, or operational detail is exposed if disclosure could weaken production controls.
- [ ] Any production-derived material was manually reviewed for disclosure risk.
- [ ] Examples use non-production placeholders such as `example.invalid`.
- [ ] Documentation describes the actual public scope without claiming private code is open source.
