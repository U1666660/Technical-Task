Rails.application.routes.draw do

  resources :postcode_data do
    collection { post :import}
  end


  get 'postcodes/index'
  root 'postcodes#index'

  get 'postcodes/validate_each'
  root 'postcodes#validate_each'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
