include:
  - percona.users

{% for file, fileinfo in pillar.get('files', {}).iteritems() %}

{{ fileinfo['dir'] }}/{{ fileinfo['file'] }}:
  file.managed:
    - source: salt://percona/files/{{ fileinfo['file'] }}
    - user: {{ fileinfo['user'] }}
    - group: {{ fileinfo['group'] }}
    - mode: {{ fileinfo['mode'] }}
    - template: {{ fileinfo['template'] }}
    - require:
      - pkg: percona_server
{% endfor %}
