# Release checklist

A public release or reviewer-facing revision is ready only when all of the following are true:

- [ ] `dart pub get` succeeds.
- [ ] `dart format --output=none --set-exit-if-changed lib test example` passes.
- [ ] `dart analyze` passes.
- [ ] `dart test` passes.
- [ ] `dart run example/main.dart` succeeds.
- [ ] `node scripts/check-public-repo.mjs` passes.
- [ ] `.env` and credential-bearing files are absent.
- [ ] `.env.example` contains placeholders only.
- [ ] no production hostname, endpoint, credential, merchant secret, wallet secret, private RPC key, or user data was copied merely for convenience.
- [ ] README, SECURITY, ARCHITECTURE, PROVENANCE, PRODUCTION_LINEAGE and PUBLIC_PRIVATE_BOUNDARY match the actual repository contents.
- [ ] ONCHAIN_EVIDENCE references only public chain data or privacy-safe aggregate production evidence.
- [ ] a human reviews the final diff for sensitive operational detail even when automated scanning is green.
- [ ] the final `main` commit has a green GitHub Actions run.
- [ ] the Apache-2.0 license and NOTICE remain present.

Automated scanning reduces accidental disclosure risk; it does not replace a human review of production-derived material.
