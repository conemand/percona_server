{% for file, fileinfo in pillar.get('files', {}).iteritems() %}

{{ fileinfo['dir'] }}/{{ fileinfo['file'] }}:
  file.managed:
    - source: salt://files/{{ fileinfo['file'] }}
    - user: {{ fileinfo['user'] }}
    - group: {{ fileinfo['group'] }}
    - mode: {{ fileinfo['mode'] }}
    - template: {{ fileinfo['template'] }}
{% endfor %}

