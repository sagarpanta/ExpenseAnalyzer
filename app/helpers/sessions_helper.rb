module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.username, user.salt]
    current_user = user
  end
  

  
  
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end

  
  private

	
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token) #*=use [] instead of 2 vars
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end	

end
