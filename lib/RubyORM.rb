# frozen_string_literal: true

require_relative "RubyORM/version"
require 'mysql2'
require 'RubyORM/base'

module RubyORM
  def self.connection=(connection)
    @connection = connection
  end

  def self.connection
    @connection or raise 'Please define a connection'
  end
end

