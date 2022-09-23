WITH contents AS (

    SELECT *
    FROM {{ ref('stg_contents') }}

),

files AS (

    SELECT *
    FROM {{ ref('stg_files') }}

),

commits AS (

    SELECT distinct repo_name_unnested as repo_name
    FROM {{ ref('stg_commits') }}

),

readme_files as (

    SELECT *
    FROM files join commits using(repo_name)
    where path like '%README.md%' -- filter only README.md

),

final as (

    SELECT *
    FROM readme_files JOIN contents using(id)
)

SELECT *
FROM final