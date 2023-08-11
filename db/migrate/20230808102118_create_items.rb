class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.float :amount
      t.references :author, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
