# This migration comes from kuhsaft (originally 20)
class CreateKuhsaftCkimages < ActiveRecord::Migration
  def change
    create_table :kuhsaft_ckimages do |t|
      t.string :file

      t.timestamps
    end
  end
end
