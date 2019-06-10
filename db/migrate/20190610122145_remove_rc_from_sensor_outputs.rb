class RemoveRcFromSensorOutputs < ActiveRecord::Migration[5.2]
  def change
    remove_column :sensor_outputs, :rc, :string
    remove_column :sensor_outputs, :lq, :string
    remove_column :sensor_outputs, :ct, :string
    remove_column :sensor_outputs, :ed, :string
    remove_column :sensor_outputs, :a2, :string
    remove_column :sensor_outputs, :p0, :string
    remove_column :sensor_outputs, :p1, :string
  end
end
