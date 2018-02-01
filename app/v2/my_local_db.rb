require 'rubygems'
require 'singleton'
require 'mysql2'
require 'dotenv'
require 'pry'
require './database_schema.rb'
require './table_schema.rb'

Dotenv.overload

# Get schema from the database and return result.
module V2
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
      DatabaseSchema.new(table_schemas: self.table_schemas)
    end

    def table_schemas
      @client.query('show tables').map{ |table| 
        table_name = table["Tables_in_#{ENV['MYSQL_DATABASE']}"] 
        return {
          "#{table_name}": {
            header:  self.table_header(table: table),
            columns: self.table_columns(table: table)
          }
        }
      }
    end

    def table_header(table:)
      headers = @client.query("describe #{table}").map { |column| column.keys }

      return %w(Field Type Null Key Default Extra).map(&:freeze).freeze if headers.nil?
      header.first 
    end

    def table_columns(table:)
      @client.query("describe #{table}").map { |column| column.values }
    end
  end
end
