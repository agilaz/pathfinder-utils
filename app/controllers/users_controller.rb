class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #Make a new user and log them in
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to(characters_path)
    else
      render('new')
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end