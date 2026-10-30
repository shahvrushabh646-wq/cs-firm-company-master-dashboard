# CS Firm Company Master Dashboard

A Vercel-compatible dashboard for managing company master data, directors/KMP, auditors and compliance tasks.

## Secure cloud saving

- Company, director/KMP, auditor and compliance records are saved in the browser immediately and synchronized to the signed-in user's Supabase account.
- Sign in with the same email/password on another device to retrieve the same cloud-saved records.
- On the first sign-in, existing records in that browser are merged into the cloud account. Records already in the cloud are retained; browser-only records are added without deleting cloud records.
- Supabase Row Level Security restricts each account to its own dashboard row.
- The Supabase publishable key is used in the browser. Never put a service-role key in frontend code.
- Attachments uploaded through the current attachment controls remain in that browser's IndexedDB and are not yet synchronized to Supabase Storage. Keep separate copies of important documents.

## One-time Supabase setup

1. Open the Supabase project configured in `index.html`.
2. Open **SQL Editor**, paste the complete contents of `SUPABASE_SETUP.sql`, and run it once.
3. In **Authentication → Providers**, ensure Email/password sign-in is enabled.
4. In **Authentication → URL Configuration**, add the deployed Vercel domain to the allowed Site URL / Redirect URLs.
5. Deploy this branch to Vercel after reviewing/merging the pull request.
6. Open the dashboard, create an account, verify the email if Supabase requests it, and sign in. Use that same account on every device.

## Deploy

- Vercel serves the static `index.html` through `vercel.json`.
- Confirm the deployed dashboard loads and that the header shows **Cloud sync: saved ✓** after a record is saved.

## Included

- Searchable company register with CIN/LLPIN duplicate checks
- Company capital, ROC, status, address, contact and source/verification fields
- Director/KMP and auditor registers
- Compliance task tracking
- CSV import/export and JSON backup/restore
- MCA PDF / CSV / Excel import preview
- Responsive layout and record add/edit/delete

## Important limitations

- Cloud sync currently stores the dashboard records as a JSON document per authenticated Supabase user.
- Attachments are browser-local only until Supabase Storage upload/download is implemented.
- Use a unique, secure password and do not share dashboard credentials.
- No fictional company records are preloaded. Enter only verified information.
- Due dates are entered by the user; statutory deadlines are not calculated automatically.
