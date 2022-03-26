Rails.application.routes.draw do
  root "homes#index"
  get 'homes/index'
  namespace :api do
    namespace :v1 do
      # api test action
      resources :hello, only:[:index]
      resources :auth_token, only:[:create] do
        post :refresh, on: :collection
        delete :destroy, on: :collection
      end
    end
  end
end
