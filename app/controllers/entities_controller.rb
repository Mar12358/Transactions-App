class EntitiesController < ApplicationController
  def index
    @category = Group.find(params[:group_id])
    @transactions = @category.transactions.where(author: current_user).order(created_at: :desc)
  end

  def new
    @category = Group.find(params[:group_id])
    @transaction = Entity.new
  end

  def create
    @category = Group.find(post_params[:category_id])
    @transaction = Entity.new(post_params)
    @transaction.author = current_user
    if @transaction.save
      redirect_to group_entities_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def post_params
    params.require(:entity).permit(:amount, :name, :category_id)
  end
end
