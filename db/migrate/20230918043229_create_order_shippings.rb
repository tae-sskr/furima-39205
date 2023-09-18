class CreateOrderShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :order_shippings do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :building_name
      t.integer :telephone, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
