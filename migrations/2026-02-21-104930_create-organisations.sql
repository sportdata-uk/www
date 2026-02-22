create table public.organisations (
  id uuid not null default gen_random_uuid (),
  name character varying not null,
  sport_id uuid not null,
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now(),
  delete_at timestamp with time zone default null,
  constraint organisations_pkey primary key (id),
  constraint organisations_name_key unique (name),
  constraint organisations_sport_id_fkey foreign KEY (sport_id) references sports (id)
) TABLESPACE pg_default;

CREATE POLICY "select organisations" ON public.organisations
  AS PERMISSIVE
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "insert organisations" ON public.organisations
  AS PERMISSIVE
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "update organisations" ON public.organisations
  AS PERMISSIVE
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "delete organisations" ON public.organisations
  AS PERMISSIVE
  FOR DELETE
  TO authenticated
  USING (true);

INSERT INTO
  "public"."organisations" (
    "id",
    "name",
    "sport_id",
    "created_at",
    "updated_at",
    "delete_at"
  )
VALUES
  (
    'f8efff55-a1ac-46a9-9b0c-57795f416e61',
    'Hertfordshire Basketball League',
    '48127bd0-71f9-44fa-ab8b-fc90b69613ce',
    '2026-02-21 10:59:14.062236+00',
    '2026-02-21 10:59:14.062236+00',
    null
  );
