Rails.application.routes.draw do
  root "top#index"
  resources :top, only: %i(index)
  resources :sessions, only: %i(new create destroy)
  resources :users, except: %i(show index) do
    collection do
      get 'step1'
      get 'step2'
    end
  end
end
