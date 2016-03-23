module Bank
  class ApplicationController < ActionController::Base
    layout "bank/application"

    if defined? PlayAuth
      helper PlayAuth::SessionsHelper
    end
  end
end