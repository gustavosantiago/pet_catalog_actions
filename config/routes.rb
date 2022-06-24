Actions::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pets, only: %i(create update)
    end
  end
end
