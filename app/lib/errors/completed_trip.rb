module Errors
  class CompletedTrip < StandardError
    def message
      "Trip completed"
    end
  end
end
