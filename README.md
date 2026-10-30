# CS Firm Company Master Dashboard

A Vercel-compatible dashboard for managing company master data, directors/KMP, auditors and compliance tasks.

## Dashboard access and cloud sync

- The dashboard opens directly without showing a login page.
- Records continue saving immediately in this browser.
- Select **Cloud sign in** in the header when you want secure sync across devices. Once signed in, the session is remembered on that device.
- Sign in with the same email/password on each device to access the same cloud records.
- On first sign-in, browser records are merged into the account. Existing cloud records are retained; duplicate records with the same `_id` are not added twice.
- Supabase Row Level Security restricts each account to its own dashboard row.
- The frontend uses only the Supabase publishable key. Never put a service-role key in frontend code.
- Attachments uploaded through current attachment controls remain in that browser's IndexedDB and are not synchronized to Supabase Storage yet. Keep separate copies of important documents.

## One-time Supabase setup

1. Open Supabase project `pbokvrygnkbkanevibeu`.
2. Open **SQL Editor**, paste the complete contents of `SUPABASE_SETUP.sql`, and run it once.
3. In **Authentication → Providers**, ensure Email/password sign-in is enabled.
4. In **Authentication → URL Configuration**, add your deployed Vercel domain to the allowed Site URL / Redirect URLs.
5. Deploy the updated `main` branch to Vercel.
6. Open the dashboard. It loads without a login prompt. Select **Cloud sign in**, create/sign in to your account, verify email if requested, and use that same account on every device.

## Included

- Searchable company register with CIN/LLPIN duplicate checks
- Company capital, ROC, status, address, contact and source/verification fields
- Director/KMP and auditor registers
- Compliance task tracking
- CSV import/export and JSON backup/restore
- MCA PDF / CSV / Excel import preview
- Responsive layout and record add/edit/delete

## Important limitations

- Cloud sync stores dashboard records as a JSON document per authenticated Supabase user.
- Attachments remain browser-local until Supabase Storage upload/download is implemented.
- Without signing in, the dashboard works locally on that browser but cannot privately sync across devices.
- No fictional company records are preloaded. Enter only verified information.
- Due dates are entered by the user; statutory deadlines are not calculated automatically.
