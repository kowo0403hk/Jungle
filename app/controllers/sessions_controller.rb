class SessionsController < ApplicationController
  # This is where we process login and logout logic

  def new
  end

  def create
    # the authenticate method is from the bcrypt library
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      #if password matches, then we use assign cookies to this user and login him/her in
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
    end
  end

  # Add "before_filter :authorize" to any controller that you want to secure with this login logic

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
