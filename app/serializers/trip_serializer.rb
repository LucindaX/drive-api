class TripSerializer < ActiveModel::Serializer
  attributes :id, :start_latlng, :end_latlng, :status, :end_time, :created_at
  def start_latlng
    [object.start_lat, object.start_lng]
  end
  def end_latlng
    [object.end_lat, object.end_lng]
  end
  #has_many :checkpoints
end
