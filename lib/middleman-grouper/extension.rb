# Require core library
require 'middleman-core'

# Extension namespace
class MiddlemanGrouper < ::Middleman::Extension
  option :name, nil, "A unique string to indentify a group among multiple groups."
  option :scope, "/", "The folder relative to source that this group should pull resources from."
  option :callback, nil, "A function to be called on each resource after adding to the group."

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
  end

  # A Sitemap Manipulator
  def manipulate_resource_list(resources)
    binding.pry
    resources.each do |resource|
      
    end
    binding.pry
    resources
  end

  # helpers do
  #   def a_helper
  #   end
  # end
end
