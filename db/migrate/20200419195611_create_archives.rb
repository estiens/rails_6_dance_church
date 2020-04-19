class CreateArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :archives do |t|
      t.string :mixcloud_url
      t.date :date
      t.integer :archive_type
      t.references :dj
      t.timestamps
    end
  end
end
