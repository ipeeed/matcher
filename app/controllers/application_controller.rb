class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login
  
  private
  def require_login
    unless logged_in_as_owner && logged_in_as_transporter
      flash[:warning] = "Please log in first, or sign in if you're new."
      redirect_to root_url
    end
  end
end
