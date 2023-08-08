class CreateBalanceItems < ActiveRecord::Migration[7.0]
  def change
    create_table :balance_items do |t|
      t.references :item, null: false, foreign_key: true
      t.references :balance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
