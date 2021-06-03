class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :profile_img
      t.string :banner_img
      t.string :experience
      t.float :avg_rating
      t.string :address
      t.float :latitude
      t.float :longitude
      t.float :max_radius
      t.boolean :sitter, default: false
      t.boolean :advisor, default: false
      t.boolean :public, default: true

      t.timestamps
    end
  end
end
