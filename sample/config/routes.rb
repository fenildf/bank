Rails.application.routes.draw do
  Bank::Routing.mount '/', :as => 'bank'
  mount PlayAuth::Engine => '/auth', :as => :auth
end
