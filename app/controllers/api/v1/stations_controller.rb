class Api::V1::StationsController < Api::V1::ApiController
  def index
    @stations = Station.paginate(:page => params[:page] || 1, :per_page => 10).order(created_at: :desc)
    render json: @stations
  end
end
