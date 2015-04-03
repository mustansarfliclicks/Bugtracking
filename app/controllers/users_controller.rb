class UsersController < ApplicationController
  def assign_to

      @user=User.find(params[:format])
      @current_project=Project.find(session[:currentproject_id])
      @current_project.users<<@user
      redirect_to projects_path
  end
end
