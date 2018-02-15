require 'rubygems'
require 'pry'
require 'test/unit'
require 'spreadsheet'

require_relative '../../../../app/v2/outs/xls/main'

module V2
  module Outs
    module Xls
      class TC_Main < Test::Unit::TestCase
        def setup
          @xls_main = App::V2::Outs::Xls::Main.new(file_name: 'staging.xls')
        end

        # attr_writerとしているので、どうやって@xls_main.file_nameと呼び出し、値が変わったかのテストをしようか迷っています。
        def test_attr_writer_file_name
          # @xls_main.file_name = 'new_staging.xls'
        end

        # def format(database_schema:)
        #   database_schema.table_schemas.each do |schema|
        #     sub_sheet = App::V2::Outs::Xls::Sub.new(main: @sheet)
        #     sub_sheet.name(name: schema.table_name)
        #     sub_sheet.cells(header: schema.header, columns: schema.columns)
        #     self.save
        #   end
        # end
        # 上のメソッドのテストをどのように書いたらいいのかわからないので、ヒントをいただけないでしょうか？
        def test_format

        end

        def test_save

        end
      end
    end
  end
end
