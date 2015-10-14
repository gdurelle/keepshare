Rails.application.routes.draw do
  root 'welcome#home'

  resources :lists, only: %i(index show create update destroy) do
    resources :items, only: %i(index show create update destroy)
  end

  resources :users, only: %i(show create update destroy)
end
