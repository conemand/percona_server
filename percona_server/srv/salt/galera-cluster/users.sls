{% for user, args in pillar.get('users', {}).iteritems() %}
{% for host in args['host'] %}

{{host}}-{{user}}:
  mysql_user.present:
    - name: {{ user }}
    - host: {{ host }}
    - password: {{ args['password'] }}

{% endfor %}
{% endfor %}

{% for user, args in pillar.get('revokedusers', {}).iteritems() %}
{% for host in args['host'] %}

{{host}}-{{user}}:
  mysql_user.absent:
    - name: {{user}}
    - host: {{host}}
    - connection_user: root

{% endfor %}
{% endfor %}

{% for user, args in pillar.get('admins', {}).iteritems() %}
{% for host in args['host'] %}

{{host}}-{{user}}:
  mysql_user.present:
    - name: {{ user }}
    - host: {{ host }}
    - password: {{ args['password'] }}

{% endfor %}
{% endfor %}

