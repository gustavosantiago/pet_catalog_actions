Actions::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :pets, except: %i(index show) do
        member do
          patch :adopted
        end
      end
    end
  end
end
