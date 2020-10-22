class UsersController < ApplicationController
before_action :check_for_admin, :only => [:index]

  def index
    @users = User.all
    @groups = Group.all
  end

  def new
    if @current_user.present?
      redirect_to root_path
    else
    @user = User.new
    end
  end

  def create
  @user = User.new user_params
  if @user.save #if this worked
    session[:user_id] = @user.id
    redirect_to group_path(@user.id)
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
