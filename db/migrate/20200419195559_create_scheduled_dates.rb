class CreateScheduledDates < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_dates do |t|
      t.date :date
      t.boolean :no_dance_church, default: false, null: false
      t.references :dj
      t.timestamps
    end
  end
end
