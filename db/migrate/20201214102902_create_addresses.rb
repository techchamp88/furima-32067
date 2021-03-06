class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer  :shipper_id,           null: false
      t.string   :post_code,            null: false
      t.string   :city,                 null: false
      t.string   :address,              null: false
      t.string   :building
      t.string   :tel_num,              null: false
      t.references :user_item,         foreign_key: true
      t.timestamps
    end
  end
end
