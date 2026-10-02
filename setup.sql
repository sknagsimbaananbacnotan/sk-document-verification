create table if not exists public.sk_documents (
  id uuid primary key default gen_random_uuid(),
  document_no text unique not null,
  date_issued date not null,
  document_type text not null,
  recipient text not null,
  subject text default '',
  notes text default '',
  status text not null default 'VERIFIED' check (status in ('VERIFIED','REVOKED')),
  revoked_at timestamptz,
  created_at timestamptz not null default now()
);
alter table public.sk_documents enable row level security;
-- No public RLS policies are intentionally created. Public verification and admin access run through server-side Vercel functions.
