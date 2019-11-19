# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'v1/auth'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :v1 do
    get :favorites, controller: :favorites, action: :index
    resources :recipes, only: %i[create index show update] do
      post :fork, controller: :forks, action: :create
      post :favorite, controller: :favorites, action: :create
    end
  end
end
