class FriendRequest < ApplicationRecord

  validate do |request|
    if !request.persisted? && request.requestor.friends.include?(request.receiver)
      request.errors.add(:base, 'Already Friends')
    elsif !FriendRequest.previous_requests(request).empty?
      request.errors.add(:base, 'Friend Request has already been sent')
    end
  end

  belongs_to :requestor, class_name: "User"
  belongs_to :receiver, class_name: "User"

  def self.previous_requests(request)
    (FriendRequest.where("requestor_id = ? AND receiver_id = ? AND response != ?", request.requestor_id, request.receiver_id, 'pending') + FriendRequest.where("requestor_id = ? AND receiver_id = ? AND response != ?", request.receiver_id, request.requestor_id, 'pending')) - [request]
  end

  
end

