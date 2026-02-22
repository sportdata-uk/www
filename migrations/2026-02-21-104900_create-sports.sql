create table public.sports (
  id uuid not null default gen_random_uuid (),
  name character varying not null,
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now(),
  delete_at timestamp with time zone default null,
  constraint sports_pkey primary key (id),
  constraint sports_name_key unique (name)
) TABLESPACE pg_default;

CREATE POLICY "select sports" ON public.sports
  AS PERMISSIVE
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "insert sports" ON public.sports
  AS PERMISSIVE
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "update sports" ON public.sports
  AS PERMISSIVE
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "delete sports" ON public.sports
  AS PERMISSIVE
  FOR DELETE
  TO authenticated
  USING (true);

INSERT INTO
  "public"."sports" (
    "id",
    "name",
    "created_at",
    "updated_at",
    "delete_at"
  )
VALUES
  (
    '48127bd0-71f9-44fa-ab8b-fc90b69613ce',
    'Basketball',
    '2026-02-21 10:59:13.042236+00',
    '2026-02-21 10:59:13.042236+00',
    null
  ),
  (
    'cdb4d72c-73cd-426c-8d91-f51eb0c98cd0',
    'Tennis',
    '2026-02-21 10:59:20.758114+00',
    '2026-02-21 10:59:20.758114+00',
    null
  );
