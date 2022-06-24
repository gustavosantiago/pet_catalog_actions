module Actions
  module Api
    module V1
      class ApplicationController < Discovery::ApplicationController
        def render_not_found
          render json: { message: 'Pet not found' }, status: :not_found
        end
      end
    end
  end
end
