require 'rubygems'
require 'pry'
require 'test/unit'
require 'spreadsheet'

require_relative '../../../../app/v2/outs/xls/main'
require_relative '../../../../app/v2/outs/xls/sub'

module V2
  module Outs
    module Xls
      class TC_Sub < Test::Unit::TestCase
        def setup
          @xls_main = App::V2::Outs::Xls::Main.new(file_name: 'staging.xls')
        end
      end
    end
  end
end
