module FriendshipConcern
	extend ActiveSupport::Concern

  included do 
    validates :friendship_exists, on: :create
  end

  def friendship_exists
    if self.friend_one.friends.include?(self.friend_two)
      self.errors.add(:base, 'Already Friends')
    end
  end
end