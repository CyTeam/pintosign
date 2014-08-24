# This migration comes from kuhsaft (originally 8)
class AddDisplayStylesToBricks < ActiveRecord::Migration
  def change
    add_column :kuhsaft_bricks, :display_styles, :text
  end
end
