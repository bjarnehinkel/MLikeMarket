Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    devise_for :users
    root to: 'pages#home'
    get '/about_us', to: 'pages#about_us', as: 'about_us'
    # get '/impressum', to: 'pages#impressum', as: 'impressum'
    # get '/datenschutz', to: 'pages#datenschutz', as: 'datenschutz'
    resources :brands, only: :show  do
      resources :categorys, path: '/categories', only: :show do
        resources :products, only: [:show, :index]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
