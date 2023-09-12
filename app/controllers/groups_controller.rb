class GroupsController < ApplicationController
  load_and_authorize_resource
  def index
    @categories = Group.includes(:transactions, :author).where(author: current_user)
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.new(group_params)

    if @category.save
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
