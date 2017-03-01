class CreateAttractions < ActiveRecord::Migration[5.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.references :destination, foreign_key: true
      t.text :about
      t.string :slug
      t.text :excerpt
      t.string :website
    end
    add_index :attractions, :slug, unique: true
  end
end
