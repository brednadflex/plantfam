class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :image_url
      t.string :posted_on
      t.text :content

      t.timestamps
    end
  end
end
