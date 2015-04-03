class ProjectsController < ApplicationController
load_and_authorize_resource 

def index
  @project=Project.all
  if(current_user)
    if(current_user.user_type=='developer')
    @project=current_user.projects
   end
  end
end

 
 def show
    @project=Project.find(params[:id])

  end

  def new
     @project=Project.new
  end

  def edit
     @project=Project.find(params[:id])
  end

  def create  
     @project=current_user.ownprojects.create(project_params)
     redirect_to @project
  end

  def update
      @project=Project.find(params[:id])
      @project.update(project_params)
      redirect_to action: "index"
   
    
  end

  def destroy
      @project=Project.find(params[:id])
      @project.destroy
      redirect_to action: "index"
  end

  def assign
      @@current_project=Project.find(params[:id])
      @developers=User.where(:user_type=>'developer')
    
  end
  def assign_to
    if(@project)
    else
      @user=User.find(params[:id])
      @@current_project.users<<@user
      redirect_to projects_path
     end
end

  private

  def project_params
    params.require(:project).permit(:title)
  end

  

end
