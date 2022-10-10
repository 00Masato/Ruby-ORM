require "RubyORM"

module RubyORM
  class Runner
    def self.generate
      RubyORM.connection = Mysql2::Client.new(
        host: 'localhost',
        username: 'root',
        password: 'password',
        database: 'ruby_orm_sample'
      )
      schema_path = "./spec/db/Schemafile"
      File.open(schema_path)
      sqls = File.read(schema_path).strip.split(";");
      schema = RubyORM::Base.new
      sqls.each do |sql|
        schema.query(sql)
      end
    end
  end
end
