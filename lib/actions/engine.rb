module Actions
  class Engine < ::Rails::Engine
    isolate_namespace Actions
    config.generators.api_only = true
  end
end
