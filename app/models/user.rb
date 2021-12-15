# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :photos, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  has_many :friend_requests_as_requestor, class_name: 'FriendRequest', foreign_key: 'requestor_id'
  has_many :friend_requests_as_receiver, class_name: 'FriendRequest', foreign_key: 'receiver_id'


  def friends
    friendships = Friendship.where(
      "friend_one_id = ? OR friend_two_id = ?", self.id, self.id
    ).map do |friendship| 
      if friendship.friend_one == self
        friendship.friend_two
      else 
        friendship.friend_one
      end
    end
  end
  
end

