Rails.application.routes.draw do
  root "sessions#new"

  get  "/login",  to: "sessions#new", as: 'login'
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: 'logout'

  resources :users do
    resources :bike_services
    member do
      get :services_pdf
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
