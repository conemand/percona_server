mysql_databases:
  test_database:
    encoding: utf8
    collation: utf8_bin
    users:
      - name: test_user
        host: localhost
        grants: all privileges
