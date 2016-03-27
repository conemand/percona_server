revokedusers:
  root:
    host: 
      - 127.0.0.1
      - ::1
      - {{ grains['fqdn'] }}
  '''''':
    host: 
      - localhost
      - {{ grains['fqdn'] }}
