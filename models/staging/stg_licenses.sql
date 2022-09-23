WITH licenses AS (

    SELECT *
    FROM {{ source('github', 'licenses') }}

)

SELECT *
FROM licenses
