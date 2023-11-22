class MonetizeBoard < ActiveRecord::Migration[7.1]
  def change
    add_monetize :boards, :price
  end
end
