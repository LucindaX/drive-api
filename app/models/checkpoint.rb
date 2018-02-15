class Checkpoint < ApplicationRecord
  attr_accessor :latlng
  before_validation :convert_latlng
  belongs_to :trip
  validates_presence_of :lat, :lng

  def convert_latlng
    self.lat, self.lng = latlng if latlng
  end
end
