class DatabaseSchema
  attr_accessor :tables

  def initialize(tables:)
    @tables = tables
  end

end
