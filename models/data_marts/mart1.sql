WITH commits AS (
  
  SELECT *
  FROM {{ ref('stg_commits') }}

),

languages AS (
    
  SELECT *
  FROM {{ ref('stg_languages') }}
  
),

licenses AS (
      
  SELECT *
  FROM {{ ref('stg_licenses') }}
  
),

origin_names AS (
      
  SELECT *
  FROM {{ ref('origin_names') }}
  
),

final AS (

  SELECT c.*, la.* EXCEPT(repo_name), li.* EXCEPT(repo_name), ona.origin
  FROM commits c JOIN languages la on c.repo_name_unnested = la.repo_name
                 JOIN licenses li on c.repo_name_unnested = li.repo_name
                 LEFT JOIN origin_names ona on SUBSTR(c.author.name, 1, INSTR(c.author.name, ' ')) = ona.first_name # join only on first name

)

SELECT *
FROM final
