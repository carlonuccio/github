WITH files AS (

    SELECT *
    FROM {{ source('github', 'files') }}

)

SELECT *
FROM files
