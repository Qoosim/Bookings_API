class ChangeDataTypeForDate < ActiveRecord::Migration[6.0]
  def self.up
    change_table :appointments do |t|
      t.change :date, :decimal
    end
  end
  def self.down
    change_table :appointments do |t|
      t.change :date, :string
    end
  end
end
