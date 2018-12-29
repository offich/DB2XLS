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

        def test_attr_writer_file_name
        end

        def test_format

        end

        def test_save

        end
      end
    end
  end
end
