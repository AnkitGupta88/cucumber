require 'sequel'

DB = Sequel.connect(
  adapter: 'mysql2',
  host: 'localhost',
  database: 'gold_test',
  user: 'root')
