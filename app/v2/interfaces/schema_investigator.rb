module App
  module V2
    module Interfaces
      module SchemaInvestigator
        def investigate
          raise NotImplementedError, "You must implement #{self.class}##{__method__}"
        end
      end
    end
  end
end
