# CS Firm Company Master Dashboard

A Vercel-compatible static dashboard for managing company master data, directors/KMP, auditors and compliance tasks.

## Deploy
- Vercel is configured through `vercel.json` to serve `index.html`.
- The project is designed to auto-deploy from the connected GitHub repository's production branch.
- After deployment, open the Vercel deployment and confirm the dashboard renders.

## Included
- Searchable company register with CIN/LLPIN duplicate checks
- Company capital, ROC, status, address, contact and source/verification fields
- Director/KMP and auditor registers
- Compliance task tracking with overdue count
- CSV import/export and JSON backup/restore
- Responsive layout and record add/edit/delete

## Important limitations
- This build stores records in browser `localStorage` for the current browser profile only. It does not synchronize across team members or devices.
- It has no user authentication, role-based permissions, managed database, or encrypted document storage. Do not enter confidential client records until those production controls are implemented.
- No fictional company records are preloaded. Enter only verified information.
- Due dates are entered by the user; statutory deadlines are not calculated automatically.
