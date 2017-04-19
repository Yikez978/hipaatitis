Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get 'search/:role', to: 'home#search', as: 'search'
  post 'home', to: 'home#sign_in', as: 'sign_in'
  delete '/', to: 'home#sign_out', as: 'sign_out'

  get 'people(/:id)', to: 'people#show', as: 'people'
  get 'people/:person_id/appointments/:id', to: 'appointments#show', as: 'appointments'

  mount SqlProbe::Engine => '/sql_probe' if defined? SqlProbe
end
