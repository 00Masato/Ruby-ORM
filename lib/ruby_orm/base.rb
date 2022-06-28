require 'ruby_orm/result_set'

module RubyORM
  class Base
    def query(sql)
      results = connection.query(sql)
      ResultVal.new(results)
    end

  private
    def connection
      RubyORM.connection
    end
  end
end
