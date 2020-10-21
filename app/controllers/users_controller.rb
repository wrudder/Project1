class UsersController < ApplicationController

  def index
    @users = User.all
    @groups = Group.all
  end
  def new
    @user = User.new

  end

  def create
  @user = User.new user_params
  if @user.save #if this worked
    session[:user_id] = @user.id
    redirect_to root_path
    else
      render :new
    end
  end

  def show
  @user = User.find(params[:id])
  @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    user = User.find(params[:id])
    user.update user_params
    redirect_to user_path
  end

  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to posts_path
 end



  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :image, :post_id, :group_ids => [])
  end


end
