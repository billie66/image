Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  root 'users#index'
  resources :users
  resources :photos, :only => [:index, :create] do
    collection do
    end
  end
end
