# Contributing

Thanks for helping improve the Zynost client public reference.

This repository is intentionally smaller than the private production client. Contributions should improve the public reference, tests, documentation or reviewer experience without expanding the production disclosure surface unnecessarily.

## Before opening a pull request

- run `dart pub get`;
- run `dart format --output=none --set-exit-if-changed lib test example`;
- run `dart analyze`;
- run `dart test`;
- run `node scripts/check-public-repo.mjs`;
- review your diff manually for sensitive material.

## Do not contribute

Never include real:

- API keys or OAuth secrets;
- tokens, cookies or session material;
- database credentials;
- wallet private keys or recovery phrases;
- merchant or webhook secrets;
- private RPC/provider credentials;
- service-account files;
- customer, merchant or user data;
- admin-only operational routes;
- anti-abuse, fraud or sponsorship thresholds that would weaken production controls;
- private production source simply to make the public repository look larger.

Use obvious placeholders such as `https://example.invalid` in examples.

## Production-derived changes

If a contribution is based on private production code, say so in the pull request and explain why the material is safe and useful to publish. Prefer a clean public reference when the production file contains unrelated sensitive implementation details.

## Style

Keep documentation concrete and technical. Describe what the repository actually contains; avoid inflated claims, unverifiable security guarantees, or marketing language that hides trust boundaries.
