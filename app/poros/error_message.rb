class ErrorMessage
  attr_reader :msg, :status_code

  def initialize(msg: , status_code:)
    @msg = msg
    @status_code = status_code
  end
end