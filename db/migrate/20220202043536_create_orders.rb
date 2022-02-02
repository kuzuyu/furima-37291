class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|

      t.string     :post_number,          null: false
      t.integer    :area_id,              null: false
      t.integer    :city,                 null: false
      t.integer    :address,              null: false
      t.integer    :building_name,        
      t.integer    :phone_number,         null: false
      t.references :record,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
