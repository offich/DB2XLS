require 'rubygems'
require 'pry'
require 'test/unit'

require_relative '../../app/v2/database_schema'

module V2
  class TC_DatabaseSchema < Test::Unit::TestCase
    def setup
      @table_schema = [
        ["id", "bigint(20)", "NO", "PRI", nil, "auto_increment"],
        ["Field", "Type", "Null", "Key", "Default", "Extra"],
        "active_admin_comments"
      ]
      @database_schema = App::V2::DatabaseSchema.new(table_schema: @table_schema)
    end

    def test_same_table_schema
      assert_equal(@database_schema.table_schemas, @table_schema)
    end
  end
end
