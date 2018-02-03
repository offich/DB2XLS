module App
  module V2
    module Outs
      class Console
        attr_writer :file_name

        def initialize(file_name:)
          @file_name = file_name
        end

        def format(database_schema:)

        end
      end
    end
  end
end
