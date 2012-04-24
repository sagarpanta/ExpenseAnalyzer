class SessionsController < ApplicationController
  def new
	@title = 'Sign In'
  end

  def create
	user = User.find_by_username(params[:session][:username])
	if user && User.authenticate(params[:session][:username], params[:session][:password])
		#sign in user and redirect to user's show page.
	
		sign_in user
		redirect_to graphs_path
	else 
		flash[:error] = 'Invalid email/password combination'
		render 'new'
	end
  end

  def destroy
    sign_out
    redirect_to home_path
  end
end
