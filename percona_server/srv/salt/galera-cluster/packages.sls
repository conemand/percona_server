include:
  - galera-cluster.mdb-repo
  - galera-cluster.percona-repo

mariadb_pkgs:
  pkg.installed:
    - names:
      - MySQL-python
      - MariaDB-client
      - MariaDB-Galera-server
      - galera
      - socat
    - disablerepo: percona-release
    - require:
      - pkgrepo: MariaDB10.0
  service.running:
    - name: mysql
    - enable: True

xtrabackup_pkgs:
  pkg.installed:
    - names:
      - percona-toolkit
      - percona-xtrabackup
    - require:
      - pkgrepo: percona-release
