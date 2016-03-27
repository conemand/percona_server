{% set database = salt['pillar.get']('import_info:database') %}
{% set data_dir = salt['pillar.get']('import_info:origin_dir') %}
{% set sql_file = salt['pillar.get']('import_info:sql_file') %}

{% if database != None or '' %}
database_check:
  mysql_database.present:
    - name: {{ database }}
{% endif %}

sql_import:
  cmd.run:
{% if database == None or '' %}
    - name: mysql < {{ data_dir }}/{{ sql_file }}
{% else %}
    - name: mysql {{ database }} < {{ data_dir }}/{{ sql_file }}
    - require:
      - mysql_database: {{ database }}
{% endif %}
