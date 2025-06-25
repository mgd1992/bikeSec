Rails.application.routes.draw do
 
  resources :users do
    resources :bike_services
    member do
      get :services_pdf
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
