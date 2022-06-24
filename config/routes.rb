Actions::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pets, except: %i(index show)
    end
  end
end
