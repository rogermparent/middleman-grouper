# Require core library
require 'middleman-core'
require_relative 'group_controller'

# Extension namespace
module MiddlemanGrouper
  
  class Extension < ::Middleman::Extension
    self.supports_multiple_instances = true
    
    option :name, nil, "A unique string to indentify a group among multiple groups."
    option :scope, nil, "The folder relative to source that this group should pull resources from."
    option :callback, nil, "A function to be called on each resource after adding to the group."
    option :controller, ::MiddlemanGrouper::GroupController,
           "A class that inherits GroupController, allowing for "\
           "any custom methods to be added to this group."

    def initialize(app, options_hash={}, &block)
      # Call super to build options from the options_hash
      super

      # Require libraries only when activated
      # require 'necessary/library'

      # set up your extension
      raise "MiddlemanGrouper needs a scope!" unless options.scope
      unless options.controller <= GroupController
        raise "Grouper controllers must be or inherit from MiddlemanGrouper::GroupController!"
      end

      @name = options.name ? options.name.to_sym : nil
      
      # Initialize @@resources and @@controllers if they don't exist
      @@resources ||= {}
      @@instances ||= {}

      # Initialize the given key
      @@resources[@name] = {}
    end

    def after_configuration
      # Do something
    end

    # A Sitemap Manipulator
    def manipulate_resource_list(resources)
      scoped_resources = resources.select { |resource| resource.path.start_with? options.scope }
      @@instances[@name] = options.controller.new(scoped_resources, options.scope)
      resources
    end

    def self.group(name = nil)
      return @@instances[name]
    end

    def group(name = nil)
      return self.class.group(name)
    end
    expose_to_template :group

    # helpers do
    #   def a_helper
    #   end
    # end

  end
end
