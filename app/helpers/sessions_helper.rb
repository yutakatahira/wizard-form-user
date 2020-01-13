module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies[:remember_token] = { value: remember_token, expire: 2.hour }
    encrypt_remember_token = User.encrypt(remember_token)
    user.update!(remember_token: encrypt_remember_token)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  def signed_in?
    @current_user.present?
  end

end
