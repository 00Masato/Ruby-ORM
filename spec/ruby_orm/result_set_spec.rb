require 'spec_helper'

class User < RubyORM::Base
end

RSpec.describe 'ResultSet' do
  let(:user) { User.new }
  describe '#size' do
    it 'returns correct size' do
      insert_sql = 'INSERT INTO users (id, name) VALUES (1, "John")'
      user.query(insert_sql)

      select_sql = 'SELECT * FROM users'
      results = user.query(select_sql)
      expect(results.size).to eq 1
    end
  end

  describe '#each' do
    it 'returns correct value' do
      insert_sql = 'INSERT INTO users (id, name) VALUES (1, "John")'
      user.query(insert_sql)

      select_sql = 'SELECT * FROM users'
      results = user.query(select_sql)
      result_array = []
      results.each { |res| result_array << res['id'] }
      expect(result_array).to match_array([1])
    end
  end
end