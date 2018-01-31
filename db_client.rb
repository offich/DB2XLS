require 'rubygems'
require 'pry'
require 'mysql2'
require 'singleton'
require 'dotenv'

Dotenv.overload

class DbClient
  include Singleton

  TABLE_KEYS = %w(Field Type Null Key Default Extra).map(&:freeze).freeze

  def initialize
    @client ||= Mysql2::Client.new(host: ENV['MYSQL_HOST'], username: ENV['MYSQL_USERNAME'], password: ENV['MYSQL_PASSWORD'], database: ENV['MYSQL_DATABASE'], port: ENV['MYSQL_PORT'])
  end

  def columns_in_all_tables
    self.tables.map { |table|
      {
        "#{table}": self.columns(table: table)
      }
    }
  end

  def tables
    @client.query('show tables').map{ |table| table["Tables_in_#{ENV['MYSQL_DATABASE']}"] }
  end

  def columns(table:)
    @client.query("describe #{table}").map { |column| column.values }
  end
end
