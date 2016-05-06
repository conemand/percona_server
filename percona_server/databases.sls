include:
  - percona.server

# Add databases and grants

{% for database, args in pillar.get('mysql_databases', {}).iteritems() %}
percona_database_{{ database }}:
  mysql_database.present:
    - name: {{ database }}
    - charset: {{ args.encoding }}
    - collate: {{ args.collation }}
    - require:
      - service: percona_service
{% for user in args.users %}
percona_grants_for_{{ user.name }}_{{ user.host }}_on_{{ database }}:
  mysql_grants.present:
    - user: {{ user.name }}
    - host: {{ user.host }}
    - database: {{ database }}.*
    - grant: {{ user.grants }}
    - require:
      - mysql_user: {{ user.host}}-{{ user.name }}
      - mysql_database: percona_database_{{ database }}
{% endfor %}
{% endfor %}

# Remove revoked databases

{% for database in pillar.get('mysql_revoked_databases', {}) %}
percona_database_{{ database }}:
  mysql_database.absent:
    - name: {{ database }}
{% endfor %}
