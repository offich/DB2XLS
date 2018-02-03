require_relative 'table_schema'

module App
  module V2
    class DatabaseSchema
      attr_reader :table_schemas
      
      def initialize(table_schema:)
        @table_schemas = Array(table_schema)
      end
    end
  end
end
