require 'rubygems'
require 'spreadsheet'

module App
  module V2
    module Outs
      class Xls
        include Interfaces::SchemaFormatter

        attr_accessor :file_name

        def initialize(file_name:)
          @file_name = file_name
        end 

        def format(schema)

        end
      end
    end
  end
end
