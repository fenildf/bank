module Bank
  class Routing
    # Bank::Routing.mount "/bank", :as => 'bank'
    def self.mount(prefix, options)
      Bank.set_mount_prefix prefix

      Rails.application.routes.draw do
        mount Bank::Engine => prefix, :as => options[:as]
      end
    end
  end
end
