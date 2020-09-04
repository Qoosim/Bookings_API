class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bike, null: false, foreign_key: true
      t.string :date
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
