class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :model
      t.text :engine_capacity
      t.text :weight
      t.float :price
      t.string :color

      t.timestamps
    end
  end
end
