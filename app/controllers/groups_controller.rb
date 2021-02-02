class GroupsController < ApplicationController
  include GroupsHelper
  before_action :authorize, only: %i[new index]
  def new
    @group = Group.new
    @icons = icons
  end

  def index
    @groups = Group.all.order(name: 'ASC')
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:notice] = 'group created with succes'
      redirect_to groups_path
    else
      flash.now[:alert] = 'some errors while saving the form'
      @icons = icons
      render 'new'
    end
  end

  def show
    @group = Group.find_by(id: params[:id])
    @transactions = Transaction.includes(:group, :user).where(group_id: @group.id).order('created_at DESC')
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
