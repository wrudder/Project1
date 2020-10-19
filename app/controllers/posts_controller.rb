class PostsController < ApplicationController
# before_action :check_for_login


  def index
      @posts = Post.all.order('created_at desc')
      @groups = Group.all.order('created_at')

  end

  def show
    @post = Post.find params[:id]
  end

  def create

      post = Post.new post_params
      @current_user.posts << post
      redirect_to posts_path
    end

  def new
    @post = Post.new
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update post_params
    redirect_to post_path

  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
    flash[:error] = "Post was destroyed!"
  end

  private
    def post_params
      params.require(:post).permit(:title, :discription, :codesnippet, :user_id)
    end

  def check_for_login
  redirect_to login_path unless @curent_user.present?
  end
end
