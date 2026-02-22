create table public.clubs (
  id uuid not null default gen_random_uuid (),
  name character varying not null,
  season_id uuid not null,
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now(),
  deleted_at timestamp with time zone null,
  constraint clubs_pkey primary key (id),
  constraint clubs_season_id_fkey foreign KEY (season_id) references seasons (id)
) TABLESPACE pg_default;

CREATE POLICY "select clubs" ON public.clubs
  AS PERMISSIVE
  FOR SELECT
  TO public
  USING (true);

CREATE POLICY "insert clubs" ON public.clubs
  AS PERMISSIVE
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "update clubs" ON public.clubs
  AS PERMISSIVE
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "delete clubs" ON public.clubs
  AS PERMISSIVE
  FOR DELETE
  TO authenticated
  USING (true);

INSERT INTO
  "public"."clubs" (
    "id",
    "name",
    "season_id",
    "created_at",
    "updated_at",
    "deleted_at"
  )
VALUES
  (
    '16ad9b51-cd40-4985-ac17-b01b27a80bb6',
    'Oaklands Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '17255bd9-5c63-41c4-948f-0d5c04ad49e4',
    'Watford Hongkongers Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '248a3b24-4f06-46eb-be98-c19643f1ef02',
    'North Herts Knights Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '40492c1f-fcbd-4534-b2c5-2f5dca06414a',
    'Enfield Mercenaries Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '47660cff-c798-4bdc-8b66-8ec35e10322d',
    'Michaelians Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '4fbb96c5-d3ca-4318-bb79-01b77370867e',
    'Aylesbury Dux Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '51ed7575-a817-4769-88f3-f57fecb62bd8',
    'Luton Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '529dd85c-6fd0-4ae8-ade6-48d79b1e1a7e',
    'Herts Stags Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '65b18fc9-967e-4c1c-b592-b63ca8f9519e',
    'Harlow Hawks Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '7a2cfdff-72a7-4b78-9c5a-d4aaf43e8cde',
    'Herts Heat Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '817fbf13-015c-4136-82e0-299307a923b3',
    'Cranfield University Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '90060e09-9c94-457c-8ed4-420018ab659b',
    'Hatfield Magic Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '97f75717-bc12-4b29-8450-266f5c91963c',
    'Birchwood Braves Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    '9a9a57b2-5542-42df-9c0e-be63fb723fcc',
    'West Herts Warriors Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    'a5a2eb12-e49c-450f-ae38-366ca78667ea',
    'Hemel Wolves Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    'aff2321e-7edb-46cf-b955-d52ee186101a',
    'Bucks Hornets Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    'bcb38ae3-a9b1-4b49-ab8d-c7edba64d294',
    'Ravens Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    'bcd7420f-8198-4625-8b17-d378219244ac',
    'Amersham Comets Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  ),
  (
    'ec742eff-c64c-46d3-bf90-8f41828c6a56',
    'Stevenage Royals Basketball Club',
    '2860f783-332e-454a-b065-c5d17ff7d74e',
    '2026-02-20 17:58:48.200818+00',
    '2026-02-20 17:58:48.200818+00',
    null
  );
