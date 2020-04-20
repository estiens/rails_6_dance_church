class CreateDjs < ActiveRecord::Migration[6.0]
  def change
    create_table :djs do |t|
      t.string :name
      t.integer :archives_count

      t.timestamps
    end
  end
end
