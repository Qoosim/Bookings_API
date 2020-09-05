class ChangeAppointmentDateType < ActiveRecord::Migration[6.0]
  def change
    # change_column :appointments, :date, 'numeric USING CAST(date AS numeric)'
    remove_column :appointments, :date
    add_column :appointments, :date, :string
  end
end
