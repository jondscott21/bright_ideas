class PostsController < ApplicationController
  before_action :check_login
  def index
    # @posts = Post.joins(:likes).group("posts.id").order("count(posts.id) DESC")
    @posts = Post.select('posts.*, count(likes.id) as likes_count').joins('LEFT JOIN likes on posts.id = likes.post_id').group(:id).order('likes_count DESC')
  end
  def create
    post = Post.new(post_params)
    if post.save
      redirect_back(fallback_location: :back)
    else
      flash[:errors] = post.errors.full_messages
      redirect_back(fallback_location: :back)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_back(fallback_location: :back)
  end
  def post_params
    params.require(:post).permit(:idea).merge(user: current_user)
  end
end
