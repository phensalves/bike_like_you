module Api
  module V1

    class UsersController < Api::V1::ApiController
      def my_trips
        if current_user
          trips = current_user.trips.paginate(page: params[:page] || 1, per_page: 10)
                              .order(created_at: :desc)
          render json: trips
        else
          []
        end
      end
    end
    
  end
end