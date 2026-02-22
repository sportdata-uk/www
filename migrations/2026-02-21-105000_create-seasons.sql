create table public.seasons (
  id uuid not null default gen_random_uuid (),
  name character varying not null,
  start_date date not null,
  end_date date not null,
  organisation_id uuid not null,
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now(),
  deleted_at timestamp with time zone null,
  constraint seasons_pkey primary key (id),
  constraint seasons_organisation_id_fkey foreign KEY (organisation_id) references organisations (id)
) TABLESPACE pg_default;

CREATE POLICY "select seasons" ON public.seasons
  AS PERMISSIVE
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "insert seasons" ON public.seasons
  AS PERMISSIVE
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "update seasons" ON public.seasons
  AS PERMISSIVE
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "delete seasons" ON public.seasons
  AS PERMISSIVE
  FOR DELETE
  TO authenticated
  USING (true);

INSERT INTO
  "public"."seasons" (
    "id",
    "name",
    "start_date",
    "end_date",
    "organisation_id",
    "created_at",
    "updated_at",
    "deleted_at"
  )
VALUES
  (
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2025/26',
    '2025-09-01',
    '2026-04-30',
    'f8efff55-a1ac-46a9-9b0c-57795f416e61',
    '2026-02-21 11:19:02.204614+00',
    '2026-02-21 11:19:02.350093+00',
    null
  ),
  (
    '5dee37c4-6846-4114-8a3c-54311a6639d2',
    '2026/27',
    '2026-09-01',
    '2027-04-30',
    'f8efff55-a1ac-46a9-9b0c-57795f416e61',
    '2026-02-21 11:19:02.204614+00',
    '2026-02-21 11:19:02.350093+00',
    null
  );
