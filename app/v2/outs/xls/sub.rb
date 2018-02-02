require 'active_support/all'

module App
  module V2
    module Outs
      module Xls
        class Sub
            
          HEADER_ROW = 0

          def initialize(main:)
            @sub_sheet = @main.create_worksheet
          end

          def name(name:)
            @sub_sheet.name = name
          end

          def header(header:)
            @sub_sheet.row(HEADER_ROW).concat(header)
          end

          def cells(columns:)
            columns.each_with_index do |cell_row, cell_column|
              cell_row.each_with_index do |cell, cell_index_in_row|
                cell_column += 1 if @sub_sheet[cell_column, cell_index_in_row].present?
                @sub_sheet[cell_column, cell_index_in_row] = cell
              end
            end
          end
        end
      end
    end
  end
end
 
