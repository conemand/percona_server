base:
  'roles:galera-node':
    - match: grain
    - users.admins
    - users.users
    - users.revokedusers  
    - files.galera
    - galera.cluster-nodes
  'roles:bootstrap':
    - match: grain
    - users.admins
    - users.users
    - users.revokedusers  
    - files.galera
    - galera.cluster-nodes
  'roles:sql-import':
    - match: grain
    - galera.sql-import
  'roles:sql-backup':
    - match: grain
    - galera.sql-backup
  'roles:xtra-backup':
    - match: grain
    - galera.schedule
    - users.admins


