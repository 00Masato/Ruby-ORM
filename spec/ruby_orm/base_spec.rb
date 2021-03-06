require 'spec_helper'

class User < RubyORM::Base
end

RSpec.describe 'Base' do
  let(:user) { User.new }
  describe '#query' do
    it 'returns ResultVal' do
      insert_sql = 'INSERT INTO users (id, name) VALUES (1, "John")'
      results = user.query(insert_sql)
      expect(results.class).to eq RubyORM::ResultVal
    end
    it 'is correct' do
      insert_sql = 'INSERT INTO users (id, name) VALUES (1, "John")'
      user.query(insert_sql)

      select_sql = 'SELECT * FROM users'
      results = user.query(select_sql)
      expect(results.count).to eq 1
    end
  end
end
