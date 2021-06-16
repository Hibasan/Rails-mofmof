Rails.application.routes.draw do
  root to: 'property_informations#index'
  resources :property_informations,only:[:index,:new,:create,:show,:edit,:update,:destroy]
end
