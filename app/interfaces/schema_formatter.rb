module Interfaces
  module SchemaFormatter
    def format(schema)
      raise NotImplementedError, "You must implement #{self.class}##{__method__}"
    end
  end
end
