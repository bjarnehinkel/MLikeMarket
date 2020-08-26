Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :brands, only: :show  do
    resources :categorys, only: :show do
      resources :products, only: [:show, :index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
