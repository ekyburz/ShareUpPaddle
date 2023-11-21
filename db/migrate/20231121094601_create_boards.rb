class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :name
      t.boolean :availability
      t.integer :price
      t.text :description
      t.references :user

      t.timestamps
    end
  end
end
