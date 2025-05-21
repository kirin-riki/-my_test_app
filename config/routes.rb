Rails.application.routes.draw do
  resources :weights, only: [:index,:create,:new]
  resources :posts, only: [:index]

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "posts#index"
end
