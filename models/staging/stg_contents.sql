WITH contents AS (

    SELECT *
    FROM {{ source('github', 'contents') }}

)

SELECT *
FROM contents
