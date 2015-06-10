class ItemsController < ApplicationController
  #todo - ajax create and destroy
  respond_to :html, :js

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "Your item was saved"
      redirect_to root_path
    else
      flash[:error] = "Error saving ToDo - please try again."
      redirect_to item_create_path
    end
  end

  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "This item has been completed and removed."
    else
      flash[:error] = "Todo item couldn't be deleted. Please try again."
    end

    respond_with(@item) do |format|
      format.html{ redirect_to [current_user, @item] }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
