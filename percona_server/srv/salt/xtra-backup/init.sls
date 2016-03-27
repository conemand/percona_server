{% set data_dir = salt['pillar.get']('backup_info:destination_dir') %}
{% set admin = salt['pillar.get']('admins:root:name') %}
{% set pass = salt['pillar.get']('admins:root:password') %}

{{ data_dir }}:
  file.directory:
    - user: mysql
    - group: mysql
    - mode: 600
    - makedirs: True
    - require_in:
      - cmd: xtra_full_backup

xtra_full_backup:
  cmd.run:
    - name: innobackupex --user={{ admin }} --password={{ pass }} {{ data_dir }}
    - require:
      - file: {{ data_dir }}
