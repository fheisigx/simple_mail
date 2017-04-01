class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.integer "user_id"
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end

  def down
  	drop_table :posts
  end

end
