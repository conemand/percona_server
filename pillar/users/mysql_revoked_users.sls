mysql_revoked_users:
  root:
    host:
      - 127.0.0.1
      - ::1
      - {{ grains['fqdn'] }}
      - {{ grains['host'] }}
  '''''':
    host:
      - localhost
      - {{ grains['fqdn'] }}
      - {{ grains['host'] }}
  backup:
    host:
      - localhost
