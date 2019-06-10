class DeleteFirst < ActiveRecord::Migration[5.2]
  def change
    drop_table :first
  end
end
