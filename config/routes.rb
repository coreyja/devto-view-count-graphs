# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :articles, only: %w[index] do
    resource :page_views, only: %w[show]
    resource :likes, only: %w[show]
    resource :comments, only: %w[show]
  end
end
