class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
    if User.find_by(id: session[:user_id])
      redirect_to profile_url
    end
  end

  def create
    if params[:email].blank? || params[:password].blank?
      flash[:error] = 'Fill all fields, please!'
      redirect_to login_url
    else
      user = User.find_by(email: params[:email])
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:notice] = "Hello, dear #{user.name}!"
        redirect_to root_url
      else
        flash[:error] = 'Invalid email and password combination'
        redirect_to login_url
      end  
    end 
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Good bye!'
    redirect_to root_url
  end
end
