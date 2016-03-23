module Bank
  class << self
    def bank_config
      self.instance_variable_get(:@bank_config) || {}
    end

    def set_mount_prefix(mount_prefix)
      config = Bank.bank_config
      config[:mount_prefix] = mount_prefix
      Bank.instance_variable_set(:@bank_config, config)
    end

    def get_mount_prefix
      bank_config[:mount_prefix]
    end
  end
end

# 引用 rails engine
require 'bank/engine'
require 'bank/rails_routes'
