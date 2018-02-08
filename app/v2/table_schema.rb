module App
  module V2
    class TableSchema
      attr_reader :table_name, :header, :columns

      def initialize(table_name:, header:, columns:)
        @table_name = table_name
        @header     = header
        @columns    = columns
      end
    end
  end
end
