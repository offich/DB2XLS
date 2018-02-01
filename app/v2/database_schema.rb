class DatabaseSchema
  def initialize(table_schemas:)
    @table_schemas = table_schemas
  end

  def tables
    @table_schemas.map { |table_schema|
      {
        TableSchema.new(header: table_schema[:header], result: table_schema[:schema])
      }
    }
  end
end
