class Checkpoint < ApplicationRecord
  belongs_to :trip
  validates_presence_of :lat, :lng
end
