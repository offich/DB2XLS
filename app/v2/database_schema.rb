require_relative 'table_schema'

module App
  module V2
    class DatabaseSchema
      def initialize(table_schemas:)
        @table_schemas = table_schemas
      end

      def tables
        @table_schemas.map { |table_schema| 
          TableSchema.new(
            table_name: table_schema[:table_name], 
            header:     table_schema[:header], 
            columns:    table_schema[:columns]
          )
        }
      end
    end
  end
end
