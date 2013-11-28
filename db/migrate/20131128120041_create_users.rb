class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	
    	t.string :name
    	t.string :username
    	t.string :email
    	t.string :password_digest
    	t.integer :facebook_id
    	t.integer :twitter_id
    	t.integer :linkedin_id

      t.timestamps
    end
  end
end
