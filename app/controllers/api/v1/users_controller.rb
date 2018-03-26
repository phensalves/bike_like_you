class Api::V1::UsersController < Api::V1::ApiController
  def my_trips
    trips = current_user.trips.paginate(:page => params[:page] || 1, :per_page => 10).order(created_at: :desc) if current_user
    render json: trips
  end
end
