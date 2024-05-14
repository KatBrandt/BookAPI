class ErrorSerializer
    def self.serialize(error_obj)
    {
      errors: [
        {
          status: error_obj.status_code.to_s,
          title: error_obj.msg
        }
      ]
    }
  end
end 