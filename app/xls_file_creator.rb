require 'rubygems'
require './csv_sheet.rb'
require './db_client.rb'
require 'csv'
require 'spreadsheet'
require 'pry'

class CsvFileCreator

  def initialize(file_name:)
    @file_name = file_name
    @sheet = CsvSheet.new
  end

  def generate_file(data:)
    data.each do |table|
      @sheet.new_sub_sheet
      @sheet.sub_sheet_name(name: table.keys.first.to_s)
      @sheet.sub_sheet_header(header: DbClient::TABLE_KEYS)
      @sheet.sub_sheet_cells(table: table)
      @sheet.file(file_name: @file_name)
    end
  end
end


