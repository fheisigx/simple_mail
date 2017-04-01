class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t| #{:id => false}
    	t.string "username", :limit => 25
    	t.string "first_name", :limit => 25
    	t.string "last_name", :limit => 25
    	t.string "email", :default =>"", :null =>false
    	t.string "hashed_password", :limit => 40
    	t.boolean "admin", :default => false
    	
    	#t.datetime "created_at"
    	#t.datetime "updated_at"
    	t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end

end
