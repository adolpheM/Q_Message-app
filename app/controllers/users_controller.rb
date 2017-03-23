class UsersController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      first_name: params[:name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "successfully created account!"
      redirect_to "/contacts/new" 
    else 
      flash[:warning] = "Invalid Email or Password"
      redirect_to "/signup"
    end 
  end

end
    