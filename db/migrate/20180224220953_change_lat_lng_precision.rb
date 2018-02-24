class ChangeLatLngPrecision < ActiveRecord::Migration[5.0]
  def change
    change_column :trips, :start_lat, :decimal, {:precision=>10, :scale=>6}
    change_column :trips, :start_lng, :decimal, {:precision=>10, :scale=>6}
    change_column :trips, :end_lat, :decimal, {:precision=>10, :scale=>6}
    change_column :trips, :end_lat, :decimal, {:precision=>10, :scale=>6}
    change_column :checkpoints, :lat, :decimal, {:precision=>10, :scale=>6}
    change_column :checkpoints, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
