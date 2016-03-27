{% set database = salt['pillar.get']('backup_info:database') %}
{% set data_dir = salt['pillar.get']('backup_info:destination_dir') %}
{% set sql_file = salt['pillar.get']('backup_info:sql_file') %}

{{ data_dir }}:
  file.directory:
    - user: mysql
    - group: mysql
    - mode: 600
    - makedirs: True
    - require_in:
      - cmd: sql_dump

sql_dump:
  cmd.run:
{% if database == None or '' %}
    - name: mysqldump --all-databases > {{ data_dir }}/full_backup.sql
{% else %}
    - name: mysqldump {{ database }} > {{ data_dir }}/{{ sql_file }}
{% endif %}
    - require:
      - file: {{ data_dir }}
