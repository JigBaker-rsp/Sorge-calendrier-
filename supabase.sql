-- À exécuter dans Supabase > SQL Editor.
-- Objectif : calendrier familial public, sans login.
-- Attention : toute personne qui possède le lien + la clé publique pourra lire/modifier/supprimer.

create extension if not exists pgcrypto;

create table if not exists public.sorge_presences (
  id uuid primary key default gen_random_uuid(),
  person_name text not null check (length(trim(person_name)) between 1 and 80),
  start_date date not null,
  end_date date not null,
  note text,
  color text not null default '#205c4f' check (color ~ '^#[0-9A-Fa-f]{6}$'),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint sorge_dates_ok check (end_date >= start_date)
);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_sorge_presences_updated_at on public.sorge_presences;
create trigger trg_sorge_presences_updated_at
before update on public.sorge_presences
for each row execute function public.set_updated_at();

alter table public.sorge_presences enable row level security;

drop policy if exists "Lecture publique Sorge" on public.sorge_presences;
drop policy if exists "Ajout public Sorge" on public.sorge_presences;
drop policy if exists "Modification publique Sorge" on public.sorge_presences;
drop policy if exists "Suppression publique Sorge" on public.sorge_presences;

create policy "Lecture publique Sorge"
on public.sorge_presences
for select
to anon
using (true);

create policy "Ajout public Sorge"
on public.sorge_presences
for insert
to anon
with check (true);

create policy "Modification publique Sorge"
on public.sorge_presences
for update
to anon
using (true)
with check (true);

create policy "Suppression publique Sorge"
on public.sorge_presences
for delete
to anon
using (true);

grant usage on schema public to anon;
grant select, insert, update, delete on public.sorge_presences to anon;

-- Optionnel mais recommandé : active les mises à jour en temps réel entre plusieurs téléphones/ordinateurs.
alter table public.sorge_presences replica identity full;

do $$
begin
  alter publication supabase_realtime add table public.sorge_presences;
exception
  when duplicate_object then null;
end $$;
