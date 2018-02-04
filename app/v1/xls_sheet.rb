require 'rubygems'
require 'spreadsheet'

class CsvSheet

  HEADER_ROW = 0

  def initialize
    @sheet = Spreadsheet::Workbook.new
  end

  def new_sub_sheet
    @sub_sheet = @sheet.create_worksheet
  end

  def sub_sheet_name(name:)
    @sub_sheet.name = name
  end

  def sub_sheet_header(header:)
    @sub_sheet.row(HEADER_ROW).concat(header)
  end

  def sub_sheet_cells(table:)
    table.values.each do |cells|
      cells.each_with_index do |cell_row, cell_column|
        cell_row.each_with_index do |cell, cell_index_in_row|
          @sub_sheet[cell_column + 1, cell_index_in_row] = cell
        end
      end
    end
  end

  def file(file_name:)
    @sheet.write(file_name)
  end
end
