class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
	 	create_table :posts do |t|
	 		t.references :user
	 		t.string :content
	 		t.datetime :created_at
	 	end
  end
end
