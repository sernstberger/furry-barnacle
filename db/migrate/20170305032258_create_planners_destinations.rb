class CreatePlannersDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :planners_destinations do |t|
      t.references :planner, foreign_key: true
      t.references :destinations, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
    end
  end
end
