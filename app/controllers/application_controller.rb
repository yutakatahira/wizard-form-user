class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  helper_method :signed_in?
  before_action :current_user

  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" &&
      password == "admin"
    end
  end

  def production?
    Rails.env.production?
  end
end
