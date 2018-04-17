# Authentication
class SessionController < ApplicationController
  def new; end

  def signin
    cookies.permanent[:keycloak_token] = Keycloak::Client.get_token params[:email], params[:password]
    redirect_to root_path if Keycloak::Client.user_signed_in?
  end

  def logout
    flash[:success] = 'See you later' if Keycloak::Client.logout
    redirect_to root_path
  end

  def forgot_password; end

  def reset_password
    Keycloak::Internal.forgot_password params[:email], root_path
    flash[:success] = 'Please take a look at your email'
    redirect_to root_path
  end
end
