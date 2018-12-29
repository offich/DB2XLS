require 'rubygems'
require 'pry'
require 'test/unit'

require_relative '../../../app/v2/table_schema'
require_relative '../../../app/v2/database_schema'
require_relative '../../../app/v2/my_local_db'

module V2
  module Outs
    class TC_Console < Test::Unit::TestCase
      def setup
        @console = App::V2::Outs::Console.new(file_name: 'staging.xls')
      end

      def test_format

      end
    end
  end
end
