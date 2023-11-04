class PostsController < ApplicationController
  layout 'standard'
  def index
    # retrieves the user using their id
    @user = User.find(params[:user_id])
    # Get the post associated with the above user, where the authorId matches the user id above
    @posts = Post.where(author_id: params[:user_id]).order(id: :asc)
    # paginate post by showing two at a go
    @posts = @posts.paginate(page: params[:page], per_page: 2)
  end

  # an action to render specific post using the post
  def show
    @post = Post.find(params[:id])
  end
end
