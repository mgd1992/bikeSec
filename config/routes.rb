Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations]

  root "pages#home"

  resources :users do
    resources :bike_services
    member do
      get :services_pdf
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
