class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRacord::RecordInvalid, with: :render_unprocessable_entity

  before_action :authorize

  private

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
