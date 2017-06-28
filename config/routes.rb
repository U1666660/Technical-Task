Rails.application.routes.draw do
<<<<<<< HEAD

root to: 'homes#index'

  resources :postcodedata

  resources :postcodedata do
    collection { post :import}
  end

  resources :faildata

  resources :faildata do
    collection { post :import}
  end


  resources :postcodes
=======
>>>>>>> fd31c8cfa51fdee45960d86fa085cefc2ebef888
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
