class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops do |t|
      t.references :planner, foreign_key: true
      t.references :attraction, foreign_key: true
      t.date :date
      t.integer :position
    end
  end
end
