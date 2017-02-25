Rails.application.routes.draw do
  get 'characters/index'

  get 'characters/show'

  get 'characters/new'

  get 'characters/edit'

  get 'characters/delete'

  get 'spells/index'

  get 'spells/show'

  get 'spells/new'

  get 'spells/edit'

  get 'spells/delete'

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

  post 'characters/:id/load_character', to: 'characters#load_character'
end
