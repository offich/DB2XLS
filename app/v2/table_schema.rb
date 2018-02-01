class TableSchema
  attr_accessor :header, :result

  def initialize(header:, result:)
    @header = header
    @result = result
  end

end
