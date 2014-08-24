# This migration comes from kuhsaft (originally 4)
class CreateKuhsaftAssets < ActiveRecord::Migration

  def change
    create_table :kuhsaft_assets do |t|
      t.string :file
      t.timestamps
    end
  end

end
