require 'rubygems'
require 'pry'
require 'test/unit'

require_relative '../../app/v2/table_schema'

module V2
  class Test_TableSchema < Test::Unit::TestCase
    def setup
      @table_name = 'table_name'
      @header = %w(id null).map(&:freeze).freeze
      @columns = [[1, false], [2, true]]
      @table_schema = App::V2::TableSchema.new(
        table_name: @table_name, header: @header, columns: @columns
      )
    end

    def test_same_table_name_exposed
      assert_equal(@table_schema.table_name, @table_name)
    end

    def test_same_header_exposed
      assert_equal(@table_schema.header, @header)
    end

    def test_same_columns_exposed
      assert_equal(@table_schema.columns, @columns)
    end
  end
end
