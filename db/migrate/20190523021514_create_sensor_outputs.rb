class CreateSensorOutputs < ActiveRecord::Migration[5.2]
  def change
    create_table :sensor_outputs do |t|
      t.string :rc
      t.string :lq
      t.string :ct
      t.string :ed
      t.string :ba
      t.string :a1
      t.string :a2
      t.string :p0
      t.string :p1

      t.timestamps
    end
  end
end
