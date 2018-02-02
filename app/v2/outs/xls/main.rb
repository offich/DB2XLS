require          'rubygems'
require          'spreadsheet'
require_relative '../interfaces/schema_formatter'

module App
  module V2
    module Outs
      module Xls
        class Main
          include Interfaces::SchemaFormatter

          attr_accessor :file_name

          def initialize(file_name:)
            @file_name = file_name
            @sheet     = Spreadsheet::Workbook.new
          end 

          def format(schemas:)
            schemas.each do |schema|
              sub_sheet = App::V2::Outs::Xls::Sub.new(main: @sheet)
              sub_sheet.name(name: schema.table_name)
              sub_sheet.header(header: schema.header)
              sub_sheet.cells(columns: schema.columns)
              @sheet.save
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
