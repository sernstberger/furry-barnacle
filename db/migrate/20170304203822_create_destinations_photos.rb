class CreateDestinationsPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations_photos do |t|
      t.references :photo, foreign_key: true
      t.references :destination, foreign_key: true
    end
  end
end
