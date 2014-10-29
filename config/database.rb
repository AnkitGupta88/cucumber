require 'sequel'

DB = Sequel.connect(
  adapter: 'mysql2',
  host: 'localhost',
  database: 'test',
  user: 'root')
