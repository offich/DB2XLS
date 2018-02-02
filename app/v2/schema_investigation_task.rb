module App
  module V2
    class SchemaInvestigationTask
      def initialize(investigator:, formatters:)
        @investigator = investigator
        @formatters = formatters
      end

      def run
        schemas = @investigator.investigate
        @formatters.each do |formatter|
          formatter.format(schemas: schemas)
        end
      end
    end
  end
end
