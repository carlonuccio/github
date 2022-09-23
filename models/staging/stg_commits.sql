{{
    config(
        materialized='incremental',
        partition_by={
          "field": "partition_date",
          "data_type": "date",
          "granularity": "day"
        },
        unique_key='commit'
    )
}}

WITH commits AS (

    SELECT *
    FROM {{ source('github', 'commits') }}

),

filtered AS (

    SELECT *,
           DATE(TIMESTAMP_SECONDS(author.time_sec)) as partition_date
    FROM commits, unnest(repo_name) as repo_name_unnested
    WHERE EXTRACT(YEAR FROM TIMESTAMP_SECONDS(author.time_sec)) = 2022
          AND author.time_sec <= UNIX_SECONDS(CURRENT_TIMESTAMP())

    {% if is_incremental() %}

      -- this filter will only be applied on an incremental run
      where author.time_sec > (select max(event_time) from {{ this }})

    {% endif %}

)

SELECT *
FROM filtered