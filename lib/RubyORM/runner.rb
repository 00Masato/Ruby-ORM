require 'thor'

module RubyORM
  class Runner < Thor
    desc "generate", "an example task"
    def generate
      schema_path = './spec/db/Schemafile'
      File.open(schema_path)
      puts File.read(schema_path)
    end
  end
end