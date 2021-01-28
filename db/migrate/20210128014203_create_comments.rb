class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text,               nill: false
      t.references :user,         nill: false, foreign_key: true
      t.references :product,      nill: false, foreign_key: true

      t.timestamps
    end
  end
end
