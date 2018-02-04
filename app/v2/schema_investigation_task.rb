module App
  module V2
    class SchemaInvestigationTask
      def initialize(investigator:, formatters:)
        @investigator = investigator
        @formatters   = formatters
      end

      def run
        if @investigator.respond_to?(:investigate) && @formatters.all?{ |formatter| formatter.respond_to?(:format) }
          database_schema = @investigator.investigate
          @formatters.each do |formatter|
            formatter.format(database_schema: database_schema)
          end
        else 
          raise NotImplementedError
        end
      end
    end
  end
end
