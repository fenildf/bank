module Bank
  class Engine < ::Rails::Engine
    isolate_namespace Bank
    config.to_prepare do
      ApplicationController.helper ::ApplicationHelper

      Dir.glob(Rails.root + "app/decorators/bank/**/*_decorator.rb").each do |c|
        require_dependency(c)
      end

      if defined? EnterprisePositionLevel
        EnterprisePositionLevel::Post.class_eval do
          has_and_belongs_to_many :business_categories, class_name: "Bank::BusinessCategory"
        end

        Bank::BusinessCategory.class_eval do
          has_and_belongs_to_many :enterprise_posts, class_name: "EnterprisePositionLevel::Post"
        end
      end
    end
  end
end
