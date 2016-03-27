mariadb_repo:
  pkgrepo.managed:
    - name: MariaDB10.0
    - humanname: MariaDB10.0 Repository
    - baseurl: http://yum.mariadb.org/10.0/centos7-amd64
    - gpgkey: https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
    - gpgcheck: 1
    - comments:
      - '# MariaDB 10.0 CentOS repository - managed by salt {{ grains['saltversion'] }}'
      - '# http://yum.mariadb.org/10.0/centos7-amd64'
    - require_in:
      - pkg: mariadb_pkgs


