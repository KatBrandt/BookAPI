class ApplicationController < ActionController::API
  include Pagy::Backend
  after_action { pagy_headers_merge(@pagy) if @pagy }
  
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record_response

  def not_found_response(e)
    render json: ErrorSerializer.serialize(ErrorMessage.new(msg: e.message, status_code: 404)), status: :not_found
  end

  def invalid_record_response(e)
    render json: ErrorSerializer.serialize(ErrorMessage.new(msg: e.message, status_code: 404)), status: :unprocessable_entity
  end
end
