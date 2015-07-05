class Api::UsersController < ApiController
  before_action :authenticate

  def index
    users = User.all 

    render json: users, status: 200, each_serializer: UserSerializer
  end
end