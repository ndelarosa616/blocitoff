class Api::ItemsController < ApiController
  skip_before_action :authenticate, only: :create

  def create
    item = Item.new(item_params)
    item.user = current_user
    if item.save
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :user_id)
  end
end