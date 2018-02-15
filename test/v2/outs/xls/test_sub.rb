require 'rubygems'
require 'pry'
require 'test/unit'
require 'spreadsheet'

require_relative '../../../../app/v2/outs/xls/main'
require_relative '../../../../app/v2/outs/xls/sub'

module V2
  module Outs
    module Xls
      class TC_sub < Test::Unit::TestCase
        def setup
          @xls_main = App::V2::Outs::Xls::Main.new(file_name: 'staging.xls')
          @xls_sub  = App::V2::Outs::Xls::Sub.new(main: @xls_main)
        end

        def test_name
          @xls_sub.name(name: 'sub_sheet')
          assert_equal(@xls_sub.name, @xls_sub.sub_sheet.name)
        end

        # def cells(header:, columns:)
        #   columns.insert(HEADER_ROW, header)
        #   columns.each_with_index do |row, index|
        #     @sub_sheet.insert_row(index, row)
        #   end
        # end
        def test_cells

        end
      end
    end
  end
end
