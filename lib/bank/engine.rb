module Bank
  class Engine < ::Rails::Engine
    isolate_namespace Bank
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper

      Dir.glob(Rails.root + "app/decorators/bank/**/*_decorator.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
