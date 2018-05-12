Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :credit_cards
  resources :taxes
  resources :purchases do
    member do
      post 'set_payments'
      delete 'delete_payments'
    end
  end
  resources :payments do
    member do
      post 'pay'
      post 'unpay'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
