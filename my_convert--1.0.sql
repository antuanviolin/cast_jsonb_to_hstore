\echo Use "CREATE EXTENSION my_convert" to load this file. \quit
CREATE OR REPLACE FUNCTION jsonb_to_hstore(j0 jsonb)
RETURNS hstore AS 
$BODY$
    SELECT hstore(array_agg(key), array_agg(value))
    FROM jsonb_each_text(j0)
$BODY$
LANGUAGE 'sql' IMMUTABLE;

CREATE OR REPLACE FUNCTION json_to_hstore(j0 json)
RETURNS hstore AS 
$BODY$
    SELECT hstore(array_agg(key), array_agg(value))
    FROM json_each_text(j0)
$BODY$
LANGUAGE 'sql' IMMUTABLE;

CREATE CAST (jsonb AS hstore) WITH FUNCTION jsonb_to_hstore(jsonb) AS IMPLICIT;
CREATE CAST (json AS hstore) WITH FUNCTION json_to_hstore(json) AS IMPLICIT;