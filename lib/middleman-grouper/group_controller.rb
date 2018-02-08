module MiddlemanGrouper
  
  class GroupController
    def initialize(resources)
      @resources = resources || {}
    end

    def all
      return @resources.values
    end

    def find(name)
      return @resources[name]
    end
  end
  
end
