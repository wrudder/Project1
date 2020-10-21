class RepliesController < ApplicationController

  before_action :check_for_login

  def index
    @replies = Reply.all
  end

  def create

    reply = Reply.create reply_params
    post = Post.find(params[:post_id])
    post.replies << reply
    @current_user.replies << reply
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
    @replies = Reply.post_id
  end

  def update
    reply = Reply.find(params[:id])
    reply.update reply_params
    redirect_to posts_path
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to root_path
    flash[:error] = "Post was destroyed!"
  end


  private
  def reply_params
    params.require(:reply).permit(:reply, :post_id, :user_id, :user_name)
  end


end
