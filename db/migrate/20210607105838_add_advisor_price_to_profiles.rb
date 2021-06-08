class AddAdvisorPriceToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :advisor_price, :string
  end
end
