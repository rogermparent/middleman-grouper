module MiddlemanGrouper
  
  class GroupController
    
    def initialize(resources, scope = nil)
      @resources = resources
      @resources_by_filename = {}
      @resources.each do |resource|
        key = scope ? resource.normalized_path[scope.length .. -1] : resource.normalized_path
        @resources_by_filename[key] = resource
      end

      def all
        return @resources
      end

      def find(name)
        return @resources_by_filename[name]
      end
    end
    
  end
  
end
