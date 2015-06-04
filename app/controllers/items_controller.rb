class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "Your item was saved"
      redirect_to root_path
    else
      flash[:error] = "Error saving ToDo - please try again."
      redirect_to item_create_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
