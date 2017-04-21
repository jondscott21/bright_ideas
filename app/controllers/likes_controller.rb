class LikesController < ApplicationController
  before_action :check_login
  def create
    Like.create(user: current_user, post: Post.find(params[:id]))
    redirect_back(fallback_location: :back)
  end
end
