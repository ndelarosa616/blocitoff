class ItemsController < ApplicationController
  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to users_show_path
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
