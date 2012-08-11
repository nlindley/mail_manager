class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if current_user
    redirect_to users_path if current_user.try(:admin?)
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])

    if user.nil?
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    else
      log_in(user)
      flash[:success] = "You have logged in"
      if user.admin?
        redirect_to users_path
      else
        redirect_to user_path(current_user)
      end
    end
  end

  def destroy
    log_out
    flash[:notice] = "You have been logged out"
    redirect_to login_path
  end
end
