# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanGrouper < ::Middleman::Extension
  option :name, nil, "A unique string to indentify a group among multiple groups."
  option :scope, nil, "The folder relative to source that this group should pull resources from."
  option :callback, nil, "A function to be called on each resource after adding to the group."
  option :controller, GroupController, "A class that inherits GroupController, allowing for "\
                                       "any custom methods to be added to this group."

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
    raise "MiddlemanGrouper needs a scope!" unless options.scope
    options.name = options.name.to_sym
    (@resources ||= {})[options.name] ||= {}
  end

  def scoped_resources
    @resources[options.name]
  end

  def after_configuration
    # Do something
  end

  # A Sitemap Manipulator
  def manipulate_resource_list(resources)
    resources.each do |resource|
      if resource.path.start_with? options.scope
        scoped_key = resource.normalized_path[options.scope.length .. -1]
        scoped_resources[scoped_key] = resource
      end
    end
    resources
  end

  def group(name = nil)
    unless options.controller <= GroupController
      raise "Grouper controllers must be or inherit from MiddlemanGrouper::GroupController!"
    end
    if !name && @resources.count == 1
      return options.controller.new(@resources.first[1])
    end
    return options.controller.new(@resources[name])
  end
  expose_to_template :group

  # helpers do
  #   def a_helper
  #   end
  # end

  class GroupController
    def initialize(resources)
      @resources = resources
    end

    def all
      return @resources.values
    end

    def find(name)
      return @resources[name]
    end
  end
end
