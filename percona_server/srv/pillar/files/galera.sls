files:
  dot_my_cnf:
    file: .my.cnf
    dir: /root
    user: root
    group: root
    mode: 0600
    template: jinja
  minion_mysql:
    file: mysql.conf
    dir: /etc/salt/minion.d
    user: root
    group: root
    mode: 0644
    template: jinja
  my_cnf:
    file: my.cnf
    dir: /etc
    user: root
    group: root
    mode: 0644
    template: jinja
  my_galera_cnf:
    file: my-galera.cnf
    dir: /etc
    user: root
    group: root
    mode: 0644
    template: jinja
