class FriendshipValidator < ActiveModel::Validator
  def validate(request)
    if request.friend_one.friends.include?(request.friend_two)
      request.errors.add(:base, 'Already Friends')
    end
  end
end

class Friendship < ApplicationRecord
  include ActiveModel::Validations
  validates_with FriendshipValidator, on: :create

  belongs_to :friend_one, class_name: "User", foreign_key: 'friend_one_id'
  belongs_to :friend_two, class_name: "User", foreign_key: 'friend_two_id'

end