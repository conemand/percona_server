base:
  'roles:bootstrap':
    - match: grain
    - galera-cluster
  'roles:galera-node':
    - match: grain
    - galera-cluster
  'roles:sql-import':
    - match: grain
    - sql-import
  'roles:sql-backup':
    - match: grain
    - sql-backup
  'roles:xtra-backup':
    - match: grain
    - xtra-backup


