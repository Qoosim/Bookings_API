class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :model
      t.string :color
      t.string :price
      t.string :weight
      t.string :engine_capacity

      t.timestamps
    end
  end
end
