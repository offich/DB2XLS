require 'rubygems'
require 'spreadsheet'

module App
  module V2
    module Outs
      module Xls
        class Main
          attr_writer :file_name

          def initialize(file_name:)
            @file_name = file_name
            @sheet     = Spreadsheet::Workbook.new
          end 

          def format(database_schema:)
            database_schema.table_schemas.each do |schema|
              sub_sheet = App::V2::Outs::Xls::Sub.new(main: @sheet)
              sub_sheet.name(name: schema.table_name)
              sub_sheet.header(header: schema.header)
              sub_sheet.cells(columns: schema.columns)
              self.save
            end
          end

          def save
            @sheet.write(@file_name)
          end
        end
      end
    end
  end
end
