class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate
   
  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(authentication_token: token)
    end
  end
end