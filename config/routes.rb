Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars, only: %i[index show update destroy create] do
        resources :locations, only: %i[index show create destroy]
      end
    end
  end

  root to: 'home#index'
  get '/*path' => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
