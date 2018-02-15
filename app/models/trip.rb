class Trip < ApplicationRecord
  enum status: [:ongoing, :completed]
  has_many :checkpoints, dependent: :destroy
  validates_presence_of :start_lat, :start_lng
end
