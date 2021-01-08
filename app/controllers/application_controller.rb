class ApplicationController < ActionController::API
  def home
    render json: { message: "Home loading" }
  end
end
