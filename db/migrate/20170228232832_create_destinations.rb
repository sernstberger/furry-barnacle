class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.text :about
      t.string :slug
      t.text :excerpt
    end
    add_index :destinations, :slug, unique: true
  end
end
