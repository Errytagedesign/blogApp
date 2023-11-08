class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(user: current_user, post: @post)
    return unless @like.save

    redirect_to user_post_path(current_user, @post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(user_id: current_user.id)
    @like.destroy
    redirect_to user_post_path(current_user, @post)
  end
end
