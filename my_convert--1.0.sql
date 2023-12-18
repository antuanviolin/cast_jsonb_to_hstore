\echo Use "CREATE EXTENSION my_convert" to load this file. \quit
CREATE OR REPLACE FUNCTION jsonb_to_hstore(j0 jsonb)
RETURNS hstore AS 
$BODY$
    SELECT hstore(array_agg(key), array_agg(value))
    FROM jsonb_each_text(j0)
$BODY$
LANGUAGE 'sql' IMMUTABLE;

CREATE CAST (jsonb AS hstore) WITH FUNCTION jsonb_to_hstore(jsonb) AS IMPLICIT;