class ChangeAppointmentDateType < ActiveRecord::Migration[6.0]
  def change
    remove_column :appointments, :date
    add_column :appointments, :date, :string
  end
end
