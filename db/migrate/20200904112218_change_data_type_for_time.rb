class ChangeDataTypeForTime < ActiveRecord::Migration[6.0]
  def self.up
    change_table :appointments do |t|
      t.change :time, :integer
    end
  end
  def self.down
    change_table :appointments do |t|
      t.change :time, :string
    end
  end
end
