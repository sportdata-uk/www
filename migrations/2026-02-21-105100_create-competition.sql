create table public.competitions (
  id uuid not null default gen_random_uuid (),
  name character varying not null,
  season_id uuid not null,
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now(),
  deleted_at timestamp with time zone null,
  constraint competitions_pkey primary key (id),
  constraint competitions_season_id_fkey foreign KEY (season_id) references seasons (id)
) TABLESPACE pg_default;

CREATE POLICY "select competitions" ON public.competitions
  AS PERMISSIVE
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "insert competitions" ON public.competitions
  AS PERMISSIVE
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "update competitions" ON public.competitions
  AS PERMISSIVE
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "delete competitions" ON public.competitions
  AS PERMISSIVE
  FOR DELETE
  TO authenticated
  USING (true);

INSERT INTO
  "public"."competitions" (
    "id",
    "name",
    "season_id",
    "created_at",
    "updated_at",
    "deleted_at"
  )
VALUES
  (
    '42b193f1-c518-4dc5-b962-7d20ea097a40',
    'Division 2',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:51:40.06425+00',
    '2026-02-20 17:51:40.06425+00',
    null
  ),
  (
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244',
    'Division 1',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:51:26.285725+00',
    '2026-02-20 17:51:26.285725+00',
    null
  );
