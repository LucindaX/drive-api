class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.float :start_lat
      t.float :start_lng
      t.float :end_lat
      t.float :end_lng
      t.integer :status, default:0
      t.timestamp :end_time

      t.timestamps
    end
  end
end
