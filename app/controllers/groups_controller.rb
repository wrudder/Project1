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

  private
  def group_params
    params.require(:group).permit(:title)
  end
end
