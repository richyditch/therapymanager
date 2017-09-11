class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      
      session[:client_id] = nil

      if user.is_admin
      	session[:is_admin] = true
      end
      # redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:client_id] = nil
    redirect_to root_url, notice: "Logged out"
  end
end
