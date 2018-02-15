require 'rubygems'
require 'dotenv'
require 'pry'

require 'test/unit'

require_relative '../app/v2/my_local_db'
require_relative '../app/v2/table_schema'

Dotenv.load('../.env')

module V2
  class TC_MyLocalDB < Test::Unit::TestCase

    def setup
      @client = App::V2::MyLocalDb.instance
    end

    def test_the_same_instance_created
      @second_client = App::V2::MyLocalDb.instance
      assert_equal(@client.object_id, @second_client.object_id)
    end

    def test_table_schemas
      table_schemas = @client.table_schemas 
      assert_equal(table_schemas.first.class.to_s, 'App::V2::TableSchema')
    end

    def test_table_columns
      table_columns = @client.table_columns(table_name: @client.table_schemas.first.table_name)
      assert_equal(table_columns, @client.table_schemas.first.columns)
    end

    def test_table_header
      table_header = @client.table_header(table_name: @client.table_schemas.first.table_name)
      assert_equal(table_header, @client.table_schemas.first.header)
    end
  end
end
