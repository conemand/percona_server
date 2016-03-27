users:
  backup:
    password: cokolwiek2
    host:
      - 192.168.100.52
  root:
    password: {{ salt['pillar.get']('admins:root:password') }}
    host:
      - 192.168.100.51
      - 192.168.100.52
      - 192.168.100.53
