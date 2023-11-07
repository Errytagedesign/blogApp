class PostsController < ApplicationController
  layout 'standard'
  def index
    # retrieves the user using their id
    @user = User.find(params[:user_id])
    # Get the post associated with the above user, where the authorId matches the user id above
    @posts = Post.where(author_id: params[:user_id]).order(id: :asc)
    # paginate post by showing two at a go
    @posts = @posts.paginate(page: params[:page], per_page: 5)
  end

  # an action to render specific post using the post id
  def show
    @post = Post.find(params[:id])
  end

  # Render a form to create new post
  def new
    @post = Post.new
  end

  # Initialize submission of new post to create new Post using the Post.new object
  def create
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = current_user
    if @post.save
      flash[:success] = 'Post Created!'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post can not be created!'
      render :new, locals: { post: @post }
    end
  end
end
