Rails.application.routes.draw do
  get 'admin/summary'
  get 'admin/orders'

  resources :showtimes do
    get '/', to: 'orders#new'
    get '/orders', to: 'orders#new'

    resources :orders, only: %i[new create]

    root 'orders#new'
  end

  resources :orders, only: %i[show]

  root 'movies#index'
end
