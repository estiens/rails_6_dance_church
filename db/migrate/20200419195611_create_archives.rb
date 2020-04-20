class CreateArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :archives do |t|
      t.string :mixcloud_url
      t.string :other_url
      t.date :date
      t.json :mixcloud_meta
      t.string :title
      t.references :dj
      t.timestamps
    end
  end
end
