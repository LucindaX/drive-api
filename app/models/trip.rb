class Trip < ApplicationRecord
  attr_accessor :start_latlng, :end_latlng
  before_validation :convert_latlng
  enum status: [:ongoing, :completed]
  has_many :checkpoints, dependent: :destroy
  validates_presence_of :start_lat, :start_lng

  def convert_latlng
    self.start_lat, self.start_lng = start_latlng if start_latlng
    self.end_lat, self.end_lng = end_latlng if end_latlng
  end

end
