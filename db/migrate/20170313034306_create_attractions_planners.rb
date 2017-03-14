class CreateAttractionsPlanners < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions_planners do |t|
      t.references :attraction, foreign_key: true
      t.references :planner, foreign_key: true
      t.date :date
      t.integer :position
    end
  end
end
