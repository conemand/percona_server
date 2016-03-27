{% if grains['roles'][0] == 'bootstrap' %}
bootstrap_stop:
  cmd.run:
    - name: "service mysql stop"
    - require:
      - pkg: mariadb_pkgs
      - file: /etc/my.cnf
      - file: /etc/my-galera.cnf
bootstrap:
  cmd.run:
    - name: "service mysql start --wsrep-new-cluster"
    - require:
      - pkg: mariadb_pkgs
      - file: /etc/my.cnf
      - file: /etc/my-galera.cnf
      - cmd: bootstrap_stop
{% endif %}

{% if grains['roles'][0] != 'bootstrap' %}
mysql_start:
  service.running:
    - name: mysql
    - reload: True
    - watch:
      - file: /etc/my.cnf
    - require:
      - pkg: mariadb_pkgs
      - file: /etc/my.cnf
      - file: /etc/my-galera.cnf
{% endif %}

