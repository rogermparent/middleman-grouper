require "middleman-core"

Middleman::Extensions.register :grouper do
  require "middleman-grouper/extension"
  MiddlemanGrouper::Extension
end
