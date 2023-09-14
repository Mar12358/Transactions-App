class EntitiesController < ApplicationController
  load_and_authorize_resource unless Rails.env.test?

  def index
    @category = Group.find(params[:group_id])
    @transactions = @category.transactions.where(author: current_user).order(created_at: :desc)
  end

  def new
    @category = Group.find(params[:group_id])
    @transaction = Entity.new
  end

  def create
    @transaction = current_user.transactions.new(entity_params)
    if @transaction.save
      redirect_to group_entities_path(entity_params[:category_id]), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  def entity_params
    params.require(:entity).permit(:amount, :name, :category_id)
  end
end
