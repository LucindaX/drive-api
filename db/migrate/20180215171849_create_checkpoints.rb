class CreateCheckpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :checkpoints do |t|
      t.references :trip, foreign_key: true
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
