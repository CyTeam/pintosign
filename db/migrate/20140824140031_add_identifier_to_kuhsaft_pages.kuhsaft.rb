# This migration comes from kuhsaft (originally 18)
class AddIdentifierToKuhsaftPages < ActiveRecord::Migration
  def change
    add_column :kuhsaft_pages, :identifier, :string
    add_index :kuhsaft_pages, :identifier, unique: true
  end
end
