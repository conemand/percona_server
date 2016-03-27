{% set database = salt['grains.get']('database') %}
{% set sql_file = salt['grains.get']('sql_file') %}

import_info:
  origin_dir: /backup
  database: {{ database }}
  sql_file: {{ sql_file }}  
