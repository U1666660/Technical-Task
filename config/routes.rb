Rails.application.routes.draw do
root to: 'homes#index'

  resources :postcodedata

  resources :postcodedata do
    collection { post :import}
  end


  resources :postcodes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
