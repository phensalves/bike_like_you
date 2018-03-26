class Api::V1::ApiController < ApplicationController
  acts_as_token_authentication_handler_for User
  skip_before_action :verify_authenticity_token
  before_action :require_authentication!

  private

  def require_authentication!

    throw(:warden, scope: :user) unless current_user.presence

  end
end
