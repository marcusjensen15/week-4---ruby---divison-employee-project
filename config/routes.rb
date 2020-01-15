Rails.application.routes.draw do
  root to: 'divisions#index'
  resources :divisions do
    member do
      post :add
    end
  end
  resources :employees do
    member do
      post :add
      post :remove
    end
  end
  resources :projects do
    member do
      post :add
      post :remove

    end

  end
end
