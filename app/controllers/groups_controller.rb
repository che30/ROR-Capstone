class GroupsController < ApplicationController
  include GroupsHelper
  before_action :authorize,only: [:new,:index]
  def new
    @group=Group.new
    @icons = icons
  end
  def index
    @groups=Group.all.order(name: 'ASC') 
  end
def create
@group  = current_user.groups.build(group_params)
if @group.save
  flash[:success]='group created with succes'
  redirect_to groups_path
else
flash.now[:alert]= "some errors while saving the form"
  @icons = icons
  render 'new'
end

end
private
def group_params
  params.require(:group).permit(:name,:icon)
end
end