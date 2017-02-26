Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'main#index'

  resources :abilities do
    member do
      get :delete
    end
  end

  post 'abilities/:id/use_ability', to: 'abilities#use_ability'
  post 'abilities/refresh_abilities'

  resources :characters do
    member do
      get :delete
    end
  end

  get 'scrape_spells', to: 'main#scrape_spells'

  post 'characters/:id/load_character', to: 'characters#load_character'
end
