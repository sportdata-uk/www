create table public.teams (,
  id uuid  default gen_random_uuid (),,
  name character varying ,,
  club_id uuid ,,
  competition_id uuid ,,
  created_at timestamp with time zone  default now(),,
  updated_at timestamp with time zone  default now(),,
  deleted_at timestamp with time z,
  constraint teams_pkey primary key (id),
  constraint teams_club_id_fkey foreign KEY (club_id) references clubs (id),
  constraint teams_competition_id_fkey foreign KEY (competition_id) references competitions (id)
) TABLESPACE pg_default;

CREATE POLICY "select teams" ON public.teams
  AS PERMISSIVE
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "insert teams" ON public.teams
  AS PERMISSIVE
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "update teams" ON public.teams
  AS PERMISSIVE
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "delete teams" ON public.teams
  AS PERMISSIVE
  FOR DELETE
  TO authenticated
  USING (true);

INSERT INTO
  "public"."teams" (
    "name",
    "competition_id"
  )
VALUES
  (
    'Hemel Wolves 2',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Aylesbury Dux Masters',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Michaelians',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Herts Stags',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Herts Heat',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'North Herts Knights 1',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Luton',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Aylesbury Dux Elite',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Harlow Hawks',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Oaklands Wolves Coaches',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Cranfield Cranes',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Bucks Hornets',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Stevenage Royals',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Oaklands Vets',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Amersham Comets',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  ),
  (
    'Birchwood Braves',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'West Herts Warriors',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Enfield Mercenaries',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Watford Hongkongers',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Aylesbury Dux Rebels',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'North Herts Knights 2',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Ravens',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Hatfield Magic',
    '4bc51ae5-8590-4b7e-aaf5-9687bf9b5244'
  ),
  (
    'Hemel Wolves 1',
    '42b193f1-c518-4dc5-b962-7d20ea097a40'
  );
