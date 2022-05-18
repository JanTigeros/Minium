Rails.application.routes.draw do
  devise_for :authors, controllers: { omniauth_callbacks: 'authors/omniauth_callbacks' }
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  
  scope module: 'authors' do
    resources :posts do
      # resources :elements
    end
  end
  resources :posts do
    resources :comments
  end
end
