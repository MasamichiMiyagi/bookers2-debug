class RelationshipController < ApplicationController
  def create
    user = User.find(params[:user_id])
    follower = current_user.followers.new(user_id: user.id)
    follower.save
    redirect_to user_path(user)
  end

  def destroy
    user = User.find(params[:user_id])
    followed = current_user.followeds.find_by(user_id: user.id)
    followed.destroy
    redirect_to user_path(user)
  end
end
