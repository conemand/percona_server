include:
  - percona.databases

# Check if admin user password is empty
{% if salt['mysql.user_info'] is defined %}
{% if salt['mysql.user_info'](pillar['mysql_admin']['name'], pillar['mysql_admin']['host'])['Password'] is defined %}
  {% set admin_secret = salt['mysql.user_info'](pillar['mysql_admin']['name'], pillar['mysql_admin']['host'])['Password'] %}
    {% if admin_secret == '' %}
      {% set admin_passwd = '' %}
    {% endif %}
{% else %}
  {% set admin_secret = False %}
{% endif %}
{% endif %}
# Add MySQL users listed in mysql_users pillar

{% for user, args in pillar.get('mysql_users', {}).iteritems() %}
{% for host in args['host'] %}
{{host}}-{{user}}:
  mysql_user.present:
    - name: {{ user }}
    - host: {{ host }}
    - password: {{ args['password'] }}
{% if salt['mysql.user_info'] is defined %}
{% if admin_secret == '' %}
    - connection_user: {{ pillar['mysql_admin']['name'] }}
    - connection_pass: {{ admin_passwd }}
{% endif %}
{% endif %}
    - require:
      - service: percona_service
{% endfor %}
{% endfor %}

# Remove MySQL user listed in mysql_revoked_users pillar

{% for user, args in pillar.get('mysql_revoked_users', {}).iteritems() %}
{% for host in args['host'] %}
{{host}}-{{user}}:
  mysql_user.absent:
    - name: {{user}}
    - host: {{host}}
{% if salt['mysql.user_info'] is defined %}
{% if admin_secret == '' %}
    - connection_user: {{ pillar['mysql_admin']['name'] }}
    - connection_pass: {{ admin_passwd }}
{% endif %}
{% endif %}
    - require:
      - service: percona_service
{% endfor %}
{% endfor %}

# Make sure MySQL admin user exists

admin-user:
  mysql_user.present:
    - name: {{ pillar['mysql_admin']['name'] }}
    - host: {{ pillar['mysql_admin']['host'] }}
    - password: {{ pillar['mysql_admin']['password'] }}
    - require:
      - service: percona_service
