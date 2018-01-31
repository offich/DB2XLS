require 'rubygems'
require 'csv'
require 'spreadsheet'
require 'pry'

class CsvCreator

  def initialize(name:)
    @name = name
    @book = Spreadsheet::Workbook.new
  end

  def generate_file_with_data(tables:)
    tables.each do |table|
      sheet = @book.create_worksheet
      sheet.name = table.keys.first.to_s
      sheet.row(0).concat(MysqlClient::TABLE_KEYS)
      table.values.each_with_index do |columns, index|
        columns.each_with_index do |column_row, column_index|
          column_row.each_with_index do |column, column_row_index|
            sheet[column_index + 1, column_row_index] = column
          end
        end
      end
    end

    @book.write @name
  end

end


