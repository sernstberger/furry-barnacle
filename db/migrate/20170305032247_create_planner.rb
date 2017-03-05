class CreatePlanner < ActiveRecord::Migration[5.0]
  def change
    create_table :planners do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true
    end
  end
end
