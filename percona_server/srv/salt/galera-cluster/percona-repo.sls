percona_repo:
  pkgrepo.managed:
    - name: percona-release
    - humanname: Percona-Release YUM repository
    - baseurl: http://repo.percona.com/release/7/RPMS/x86_64/
    - gpgkey: https://www.percona.com/downloads/RPM-GPG-KEY-percona
    - gpgcheck: 1
    - comments:
      - '# Percona-Release YUM repository - managed by salt {{ grains['saltversion'] }}'
      - '# http://repo.percona.com/release/7/RPMS/x86_64/'
    - require_in:
      - pkg: xtrabackup_pkgs


