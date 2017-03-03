class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.references :photo, foreign_key: true
      t.references :post, foreign_key: true
      t.references :destination, foreign_key: true
      t.references :attraction, foreign_key: true
    end
  end
end
