Rails.application.routes.draw do
  get 'item_list/items'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
end
