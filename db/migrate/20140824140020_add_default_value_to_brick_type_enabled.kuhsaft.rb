# This migration comes from kuhsaft (originally 7)
class AddDefaultValueToBrickTypeEnabled < ActiveRecord::Migration
  def change
    rename_column :kuhsaft_brick_types, :disabled, :enabled
    change_column :kuhsaft_brick_types, :enabled, :boolean, :default => true
  end
end
