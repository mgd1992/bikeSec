Rails.application.routes.draw do
  root "users#index"

  resources :users do
    resources :bike_services
    member do
      get :services_pdf  # esto es para el PDF general del usuario
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
