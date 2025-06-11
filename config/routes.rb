Rails.application.routes.draw do
  root "users#index"

  resources :users do
    resources :bike_services
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
