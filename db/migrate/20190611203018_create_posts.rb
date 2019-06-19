class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :user_id
      t.text :image_url

      t.timestamps
    end
  end
end
