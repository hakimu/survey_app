class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to surveys_path
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.permit(:user).permit(:username, :password, :password_confirmation)
  end
end
