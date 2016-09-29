Rails.application.routes.draw do

root 'welcome#index'

  scope module: 'api' do
    namespace :v1 do
      resources :consumers
      resources :merchants
      resources :transactions
    end
  end

end
