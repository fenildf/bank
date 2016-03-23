Rails.application.routes.draw do
  mount Bank::Engine     => '/',     :as => 'bank'
  mount PlayAuth::Engine => '/auth', :as => :auth
end
