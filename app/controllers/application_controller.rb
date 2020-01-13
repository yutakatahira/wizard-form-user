class ApplicationController < ActionController::Base
  helper_method :signed_in?
  before_action :current_user

  protect_from_forgery with: :exception
  include SessionsHelper
end
