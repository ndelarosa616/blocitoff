class Api::UsersController < ApiController
  skip_before_action :authenticate, only: [:create, :destroy]

  def index
    users = User.all 

    render json: users, status: 200, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      user = User.find(params[:id])
      user.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:authentication_token, :email, :password)
  end
end