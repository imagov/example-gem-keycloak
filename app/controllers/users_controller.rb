# user controller
class UsersController < ApplicationController
  def new; end

  def create
    after_insert = lambda { |_user|
      flash[:success] = 'User created successfully'
      redirect_to root_path
    }

    Keycloak::Internal.create_simple_user(params[:email],
                                          params[:password],
                                          params[:email],
                                          params[:first_name],
                                          params[:last_name],
                                          [],
                                          ['Public'],
                                          after_insert)
  end
end
