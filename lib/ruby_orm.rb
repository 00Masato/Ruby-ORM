require 'mysql2'
require 'ruby_orm/base'

module RubyORM
  def self.connection=(connection)
    @connection = connection
  end

  def self.connection
    @connection or raise 'Please define a connection'
  end
end
