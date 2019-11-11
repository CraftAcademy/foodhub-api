Rails.application.routes.draw do
  namespace :v1 do
    resources :recipes, only: [:create]
  end
end
