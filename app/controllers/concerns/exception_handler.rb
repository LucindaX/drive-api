module ExceptionHandler
  extend ActiveSupport::Concern

  class CompletedTrip < StandardError; end
  
  included do
    
    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end
    
    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ExceptionHandler::CompletedTrip, with: :four_twenty_two

  end

  private

  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

end
