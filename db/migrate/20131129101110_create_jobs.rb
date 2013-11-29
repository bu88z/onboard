class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|

    	t.string :title
    	t.string :company_name
    	t.string :company_url
    	t.text :description
    	t.string :location
    	t.float :latitute
    	t.float :longitude
    	t.text :company_tagline
    	t.string :phone
    	t.string :salary
    	t.string :application_deadline

    	t.integer :user_id

    	t.string :stripe_token #later on, for payments

      t.timestamps
    end
  end
end
