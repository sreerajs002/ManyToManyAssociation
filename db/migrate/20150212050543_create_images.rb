class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :attachment, index: true

      t.timestamps null: false
    end
    add_foreign_key :images, :attachments
  end
end
