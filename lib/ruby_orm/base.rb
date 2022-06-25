module RubyORM
  class Base
    def initialize
      @client = Mysql2::Client.new(
        :host => 'localhost',
        :username => 'root',
        :password => 'password',
        :database => 'ruby_orm_sample'
      )
    end

    def query(sql)
      @client.query(sql)
    end
  end
end
