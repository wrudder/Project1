class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.integer :user_id
      t.text :codesnippet
      t.text :discription
      t.timestamps
    end
  end
end
