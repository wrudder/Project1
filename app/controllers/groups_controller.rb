class GroupsController < ApplicationController


  def index
    @groups = Group.all
    @users = User.all
  end


  def show

    @groups = Group.all
    
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params
    if @group.save
      session[:group_id] = @group.id
      redirect_to groups_path
      else
        render :new
      end
    end

    def destroy
      @group = Group.find(params[:id])
      @group.destroy
      redirect_to groups_path
      flash[:error] = "Group was deleted."
    end

  private
  def group_params
    params.require(:group).permit(:title, :user_ids => [])
  end
end
