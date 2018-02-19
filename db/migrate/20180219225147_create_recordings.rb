class CreateRecordings < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings do |t|
      t.string :status
      t.integer :temp
      t.integer :location, foreign_key: true

      t.timestamps
    end
  end
end
