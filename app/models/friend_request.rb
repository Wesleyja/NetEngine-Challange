class FriendRequest < ApplicationRecord

  validate do |request|
    if request.requestor.friends.include?(request.receiver)
      request.errors.add(:base, 'Already Friends')
    elsif FriendRequest.previous_requests(request.receiver_id, request.requestor_id)
      request.errors.add(:base, 'Friend Request has already been sent')
    end
  end

  belongs_to :requestor, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def self.previous_requests(requestor_id, receiver_id)
    FriendRequest.where("requestor_id = ? AND receiver_id = ?", requestor_id, receiver_id) + FriendRequest.where("requestor_id = ? AND receiver_id = ?", receiver_id, requestor_id)
  end
end

