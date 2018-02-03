require 'rubygems'
require 'singleton'
require 'mysql2'
require 'dotenv'
require 'pry'
require_relative 'database_schema'
require_relative 'table_schema'
require_relative 'interfaces/schema_investigator'

Dotenv.overload

# Get schema from the database and return result.
module App
  module V2
    class MyLocalDb 
      include Singleton

      def initialize
        @db_client = Mysql2::Client.new(
          host: ENV['MYSQL_HOST'], username: ENV['MYSQL_USERNAME'], 
          password: ENV['MYSQL_PASSWORD'], database: ENV['MYSQL_DATABASE'], port: ENV['MYSQL_PORT']
        )
      end

      def investigate
        DatabaseSchema.new(table_schemas: self.table_schemas).tables
      end

      def table_schemas
        @db_client.query('show tables').map{ |table| 
          table_name = table["Tables_in_#{ENV['MYSQL_DATABASE']}"] 

          {
            table_name: table_name,
            header:     self.table_header(table_name: table_name),
            columns:    self.table_columns(table_name: table_name)
          }
        }
      end

      def table_header(table_name:)
        headers = @db_client.query("describe #{table_name}").map { |column| column.keys }

        return %w(Field Type Null Key Default Extra).map(&:freeze).freeze if headers.nil?
        headers.first 
      end

      def table_columns(table_name:)
        @db_client.query("describe #{table_name}").map { |column| column.values }
      end
    end
  end
end
