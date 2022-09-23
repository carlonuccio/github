WITH languages AS (

    SELECT *
    FROM {{ source('github', 'languages') }}

)

SELECT *
FROM languages
