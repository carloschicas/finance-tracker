class FriendshipsController < ApplicationController

  def create
    current_user.friendships.build(friend_id: params[:friend])
    flash[:notice] = if current_user.save
                       'Following friend'
                     else
                       'There was something wrong'
                     end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = 'Stopped following'
    redirect_to my_friends_path
  end
end
