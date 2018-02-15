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

      # ここのテストをどのように書けばいいのかわからなくて、余白にしました..。
      # def format(database_schema:)
      #   p @file_name
      #   database_schema.table_schemas.each do |table_schema|
      #     p '-------------------'
      #     p table_schema.table_name
      #     p table_schema.header
      #     table_schema.columns.each do |row|
      #       p row
      #     end
      #  end
      def test_format

      end
    end
  end
end
