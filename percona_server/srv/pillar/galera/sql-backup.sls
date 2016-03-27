{% set database = salt['grains.get']('database') %}

backup_info:
  destination_dir: /backup
  database: {{ database }}
  sql_file: {{ database }}.sql  
