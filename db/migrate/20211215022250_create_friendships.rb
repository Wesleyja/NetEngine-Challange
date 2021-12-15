class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.bigint :friend_one_id
      t.bigint :friend_two_id

      t.timestamps
    end
    
    add_index :friendships, :friend_one_id
    add_index :friendships, :friend_two_id
  end
end
