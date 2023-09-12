class GroupsController < ApplicationController
  def index
    @categories = Group.includes(:transactions, :author).where(author: current_user)
  end

  def new
    @category = Group.new
  end

  def create
    @category = Group.new(post_params)
    @category.author = current_user

    if @category.save
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def post_params
    params.require(:group).permit(:icon, :name)
  end
end
