class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :post_cord,      null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.string :building
      t.integer :phone_number,  null: false
      t.references :deal,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
