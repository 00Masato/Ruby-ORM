require 'thor'

module RubyORM
  class Runner < Thor
    desc "generate", "an example task"
    def generate
      puts "this method is generate"
    end
  end
end