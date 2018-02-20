class AddLocationToRecording < ActiveRecord::Migration[5.1]
  def change
    remove_column :recordings, :location
    add_reference :recordings, :location, foreign_key: true
  end
end
