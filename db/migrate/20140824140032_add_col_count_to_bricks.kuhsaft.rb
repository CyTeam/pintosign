# This migration comes from kuhsaft (originally 19)
class AddColCountToBricks < ActiveRecord::Migration
  def change
    add_column :kuhsaft_bricks, :col_count, :integer, default: 0
  end
end
