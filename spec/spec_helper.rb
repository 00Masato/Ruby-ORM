# frozen_string_literal: true

require "RubyORM"

RubyORM.connection = Mysql2::Client.new(
  host: 'localhost',
  username: 'root',
  password: 'password',
  database: 'ruby_orm_sample'
)

def setup(db)
  db.query('DROP TABLE IF EXISTS users')
  db.query('CREATE TABLE users (id INTEGER NOT NULL,
                                name VARCHAR(255) NOT NULL)')
end
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  db = RubyORM.connection
  setup(db)

  config.around do |example|
    db.query('BEGIN')
    example.run
    db.query('ROLLBACK')
  end
end
