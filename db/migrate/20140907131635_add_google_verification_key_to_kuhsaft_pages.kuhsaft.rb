# This migration comes from kuhsaft (originally 21)
class AddGoogleVerificationKeyToKuhsaftPages < ActiveRecord::Migration
  def change
    add_column :kuhsaft_pages, :google_verification_key, :string
  end
end
