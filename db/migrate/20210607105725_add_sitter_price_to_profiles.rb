class AddSitterPriceToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :sitter_price, :string
  end
end
