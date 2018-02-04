require 'rubygems'
require 'spreadsheet'
require 'active_support/all'

module App
  module V2
    module Outs
      module Xls
        class Sub
            
          HEADER_ROW = 0

          def initialize(main:)
            @sub_sheet = main.create_worksheet
          end

          def name(name:)
            @sub_sheet.name = name
          end

          def cells(header:, columns:)
            columns.insert(HEADER_ROW, header)
            columns.each_with_index do |row, index|
              @sub_sheet.insert_row(index, row)
            end
          end
        end
      end
    end
  end
end
 
