require          'rubygems'
require          'spreadsheet'
require_relative '../interfaces/schema_formatter'

module App
  module V2
    module Outs
      class Xls
        include Interfaces::SchemaFormatter

        attr_accessor :file_name

        HEADER_ROW = 0

        def initialize(file_name:)
          @file_name = file_name
          @sheet     = Spreadsheet::Workbook.new
        end 

        def format(schemas:)
          schemas.each do |schema|
            self.new_sub_sheet
            self.sub_sheet_name(name: schema.table_name)
            self.sub_sheet_header(header: schema.header)
            self.sub_sheet_cells(columns: schema.columns)
            self.save_sub_sheet
          end
        end

        def new_sub_sheet
          @sub_sheet = @sheet.create_worksheet
        end

        def sub_sheet_name(name:)
          @sub_sheet.name = name
        end

        def sub_sheet_header(header:)
          @sub_sheet.row(0).concat(header)
        end

        def sub_sheet_cells(columns:)
          columns.each_with_index do |cell_row, cell_column|
            cell_row.each_with_index do |cell, cell_index_in_row|
              cell_column += 1 if !@sub_sheet[cell_column, cell_index_in_row].nil?
              @sub_sheet[cell_column, cell_index_in_row] = cell
            end
          end
        end

        def save_sub_sheet
          @sheet.write(@file_name)
        end
      end
    end
  end
end
