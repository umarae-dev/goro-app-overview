import fs from 'node:fs';
import path from 'node:path';

const root = process.cwd();
const skipped = new Set(['.git', '.dart_tool', 'build', 'coverage']);
const forbiddenNames = new Set([
  '.env', 'credentials.json', 'service-account.json', 'secrets.json',
  'id_rsa', 'id_ed25519'
]);
const patterns = [
  /-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----/,
  /ghp_[A-Za-z0-9]{20,}/,
  /github_pat_[A-Za-z0-9_]{20,}/,
  /AKIA[0-9A-Z]{16}/,
  /(?:PRIVATE_KEY|SECRET_KEY|JWT_SECRET|DATABASE_URL|DB_PASSWORD|WEBHOOK_SECRET|API_SECRET|CLIENT_SECRET)\s*[:=]\s*["'][^"']{8,}["']/i,
  /(?:seed phrase|mnemonic)\s*[:=]\s*["'][a-z]+(?:\s+[a-z]+){7,}["']/i,
];
const hits = [];

function walk(dir) {
  for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
    if (skipped.has(entry.name)) continue;
    const full = path.join(dir, entry.name);
    const rel = path.relative(root, full).replaceAll('\\', '/');
    if (forbiddenNames.has(entry.name)) hits.push(`forbidden file: ${rel}`);
    if (/^\.env\./.test(entry.name) && entry.name !== '.env.example') hits.push(`forbidden env file: ${rel}`);
    if (/\.(?:pem|key|p12|pfx|jks|keystore)$/i.test(entry.name)) hits.push(`sensitive key file: ${rel}`);
    if (entry.isDirectory()) { walk(full); continue; }
    if (!entry.isFile()) continue;
    let text;
    try { text = fs.readFileSync(full, 'utf8'); } catch { continue; }
    for (const pattern of patterns) if (pattern.test(text)) hits.push(`credential-like material: ${rel}`);
  }
}

walk(root);
if (hits.length) {
  console.error([...new Set(hits)].join('\n'));
  process.exit(1);
}
console.log('Public repository guard passed.');
