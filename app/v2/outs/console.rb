require_relative '../interfaces/schema_formatter'

module App
  module V2
    module Outs
      class Console
        include Interfaces::SchemaFormatter

        attr_accessor :file_name

        def initialize(file_name:)
          @file_name = file_name
        end

        def format(schemas:)

        end
      end
    end
  end
end
