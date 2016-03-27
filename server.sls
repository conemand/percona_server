include:
  - percona.repo

percona_server:
  pkg.installed:
    - pkgs:
      - Percona-Server-server-56
      - Percona-Server-client-56
      - Percona-Server-shared-56
      - MySQL-python
    - require:
      - file: percona_gpgkey
      - pkgrepo: percona_repo
    - require_in:
      - percona_service

percona_service:
  service.running:
    - name: mysql
    - enable: True
    - require:
      - pkg: percona_server
