# application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_signed_in?

  def initialize
    Keycloak.proc_cookie_token = lambda do
      cookies.permanent[:keycloak_token]
    end

    super
  end

  def user_signed_in?
    access = Keycloak::Client.user_signed_in? || keycloak_controller? || new_use?
    redirect_to session_new_path unless access
  end

  private

    def keycloak_controller?
      Keycloak.keycloak_controller == controller_name
    end

    def new_use?
      controller_name == 'users' && (action_name == "new" || action_name == "create")
    end
end
