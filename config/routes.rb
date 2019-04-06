Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :localities, :issues, :comments

  resources :localities do
    resources :issues
  end

  resources :issues do
    resources :comments
  end

end
