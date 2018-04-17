# main controller
class MainController < ApplicationController
  def index
    @user = JSON.parse Keycloak::Client.get_userinfo
  end
end
