Rails.application.routes.draw do
  devise_for :users
  root to: "locations#index"

  resources :locations do
    resources :recordings
  end
end
