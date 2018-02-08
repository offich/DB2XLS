module App
  module V2
    module Outs
      class Console
        attr_writer :file_name

        def initialize(file_name:)
          @file_name = file_name
        end

        def format(database_schema:)
          p @file_name
          database_schema.table_schemas.each do |table_schema|
            p '-------------------'
            p table_schema.table_name
            p table_schema.header
            table_schema.columns.each do |row|
              p row
            end
          end
        end
      end
    end
  end
end
