require 'rubygems'
require 'singleton'
require 'mysql2'
require 'dotenv'
require 'pry'

Dotenv.overload

class MyLocalDb 
  include Singleton
  include Interfaces::SchemaInvestigator

  def initialize
    @db_client = Mysql2::Client.new(
      host: ENV['MYSQL_HOST'], username: ENV['MYSQL_USERNAME'], 
      password: ENV['MYSQL_PASSWORD'], database: ENV['MYSQL_DATABASE'], port: ENV['MYSQL_PORT']
    )
  end

  def investigate

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
    @client.query("describe #{table}").map { |row| row.values }
  end
end
