require 'rubygems'
require 'spreadsheet'

class TableSchema
  attr_accessor :table_name, :header, :columns

  def initialize(table_name:, header:, columns:)
    @table_name = table_name
    @header     = header
    @columns    = columns
  end

end
