class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.float :rating
      t.boolean :recommended, default: false

      t.timestamps
    end
  end
end
