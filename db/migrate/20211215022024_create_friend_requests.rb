class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.bigint :requestor_id
      t.bigint :receiver_id
      t.string :response, default: 'pending'

      t.timestamps
    end
    add_index :friend_requests, :requestor_id
    add_index :friend_requests, :receiver_id
    #Ex:- add_index("admin_users", "username")
  end
end
