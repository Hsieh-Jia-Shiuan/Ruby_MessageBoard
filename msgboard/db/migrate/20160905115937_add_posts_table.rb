class AddPostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
        t.integer :user_id
        t.string  :title
        t.text    :content
    end
  end
end
