class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :product_name,       null: false
      t.string     :bland,              null: false
      t.integer    :origin_id,          null: false
      t.text       :text,               null: false
      t.references :user,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
