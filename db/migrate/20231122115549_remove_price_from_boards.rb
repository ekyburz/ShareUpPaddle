class RemovePriceFromBoards < ActiveRecord::Migration[7.1]
  def change
    remove_column :boards, :price, :integer
  end
end
