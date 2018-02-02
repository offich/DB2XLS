module App
  module V2
    class SchemaInvestigationTask
      def initialize(investigator:, formatters:)
        @investigator = investigator
        @formmatters = formatters
      end

      def run
        schemas = investigator.investigate
        formatters.each do |formatter|
          formatter.format(schemas)
        end
      end
    end
  end
end
