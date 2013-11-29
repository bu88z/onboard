class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :cover_letter
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
