class CheckpointSerializer < ActiveModel::Serializer
  attributes :id, :latlng, :created_at
  def latlng
    [object.lat, object.lng]
  end
end
