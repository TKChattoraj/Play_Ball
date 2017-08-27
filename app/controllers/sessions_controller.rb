class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session user
      flash[:notice] = "Welcome, #{user.first_name}!  As a manager, you can send text alerts to this site.  Try it out.  Text a message to 513-952-8704.  Example...'Reds are rained out.  Go back to sleep!'"
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end




end
