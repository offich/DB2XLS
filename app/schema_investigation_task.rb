class SchemaInvestigationTask
  def initialize(investigator:, formatters:)
    @investigator = investigator
    @formmatters = formatters
  end

  def run
    schema = investigator.investigate
    formatters.each do |formatter|
      formatter.format(schema)
    end
  end
end
