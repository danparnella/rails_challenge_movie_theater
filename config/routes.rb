Rails.application.routes.draw do
  get 'admin_dashboard/summary'
  get 'admin_dashboard/orders'

  resources :showtimes do
    get '/', to: 'orders#new'
    get '/orders', to: 'orders#new'

    resources :orders, only: %i[new create]

    root 'orders#new'
  end

  resources :orders, only: %i[show]

  root 'movies#index'
end
