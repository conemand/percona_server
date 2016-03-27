base:
  'roles:atlassian-confluence':
    - match: grain
    - users.mysql_admin
    - users.mysql_users
    - users.mysql_revoked_users
    - config.mysql_config
    - databases.mysql_databases
    - databases.mysql_revoked_databases
