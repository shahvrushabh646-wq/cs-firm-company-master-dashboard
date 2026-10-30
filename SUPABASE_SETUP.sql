-- Run this script once in Supabase SQL Editor for project pbokvrygnkbkanevibeu.
-- Stores each authenticated user's Company Master data in one JSONB row.
create table if not exists public.firm_dashboard_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{"companies":[],"directors":[],"auditors":[],"compliance":[]}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.firm_dashboard_data enable row level security;

drop policy if exists "Users can read their own firm dashboard" on public.firm_dashboard_data;
create policy "Users can read their own firm dashboard"
  on public.firm_dashboard_data for select
  to authenticated
  using (auth.uid() = user_id);

drop policy if exists "Users can insert their own firm dashboard" on public.firm_dashboard_data;
create policy "Users can insert their own firm dashboard"
  on public.firm_dashboard_data for insert
  to authenticated
  with check (auth.uid() = user_id);

drop policy if exists "Users can update their own firm dashboard" on public.firm_dashboard_data;
create policy "Users can update their own firm dashboard"
  on public.firm_dashboard_data for update
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

drop policy if exists "Users can delete their own firm dashboard" on public.firm_dashboard_data;
create policy "Users can delete their own firm dashboard"
  on public.firm_dashboard_data for delete
  to authenticated
  using (auth.uid() = user_id);

grant select, insert, update, delete on public.firm_dashboard_data to authenticated;
