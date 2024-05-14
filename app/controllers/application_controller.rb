class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def not_found_response(e)
    render json: ErrorSerializer.serialize(ErrorMessage.new(msg: e.message, status_code: 404)), status: :not_found
  end
end
