class AccessController < ApplicationController
  def login
  end

  def try_login
    if params[:username] && params[:password]
      user = User.where(:username => params[:username]).first
      if user
        authorized = user.authenticate(params[:password])
      end
    end
    if authorized
      session[:user_id] = authorized.id
      redirect_to(characters_path)
    else
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to(access_login_path)
  end
end