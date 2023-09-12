class EntitiesController < ApplicationController
  def index
    @category = Group.find(params[:group_id])
    @transactions = @category.transactions.where(author: current_user)
  end
end
