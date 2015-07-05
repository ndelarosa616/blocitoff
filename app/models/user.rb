require 'securerandom'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :items

  before_create :set_authentication_token

  private
  def set_authentication_token
    return if authentication_token.present?
    self.authentication_token = generate_authentication_token
  end

  def generate_authentication_token
    SecureRandom.uuid.gsub(/\-/,'')
  end
end
