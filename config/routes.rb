Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  match 'search/:role', to: 'home#search', as: 'search', via: %i(get post)

  get 'people/:id', to: 'people#show', as: 'people'
end
