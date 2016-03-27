percona_gpgkey:
  file:
    - managed
    - name: /etc/pki/rpm-gpg/RPM-GPG-KEY-Percona
    - source: salt://percona/files/percona_gpgkey
    - user: root
    - group: root
    - mode: 644
    - require_in:
      - pkgrepo: percona_repo

percona_repo:
  pkgrepo:
    - managed
    - name: percona-release
    - humanname: Percona-Release YUM repository - $basearch
    - baseurl: http://repo.percona.com/release/$releasever/RPMS/$basearch
    - gpgcheck: 1
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-Percona
    - require:
      - file: percona_gpgkey
    - require_in:
      - pkg: percona_server
