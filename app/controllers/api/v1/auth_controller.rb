class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(email: params[:email].downcase)
    #User#authenticate comes from BCrypt
    if @user && @user.authenticate(params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: token }, status: :accepted
    else
      render json: { message: "Invalid username or password" }, status: :unauthorized
    end
  end
end
