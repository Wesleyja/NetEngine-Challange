class FriendRequestsController < ApplicationController

  def create
    @receiver = User.find(params['receiver'])
    friend_request = FriendRequest.new(
      requestor: current_user,
      receiver: @receiver
    )
    
    if friend_request.valid?
      friend_request.save
      

      redirect_to profile_path(@receiver.username)
    else 

      redirect_to profile_path(@receiver.username), notice: "#{friend_request.errors.messages.values.join}"
    end
  end

  def update
    @friend_request = FriendRequest.find(params['request'])

    if params['response'] == 'Accept'
      friendship = Friendship.new(
        friend_one: @friend_request.requestor,
        friend_two: @friend_request.receiver
      )

      if friendship.valid?
        friendship.save
      end
      
      @friend_request.destroy

    elsif params['response'] == 'Decline'
      @friend_request.destroy
    end

    redirect_to profile_path(current_user.username)
  end


end