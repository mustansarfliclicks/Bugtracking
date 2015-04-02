class BugsController < ApplicationController
#load_and_authorize_resource 
def index
  if(params[:project_id])
    @project=Project.find(params[:project_id])
    @bug=@project.pbugs
  else
    @developer=User.find(params[:developer_id])
    @bug=@developer.pbugs
   end
  end
 def new
    @bug=Pbug.new
  end

 def show
    @bug=Pbug.find(params[:id])
  end

  

  def edit
     @bug=Pbug.find(params[:id])
  end


  def create
    @project=Project.find(params[:project_id])
    @bug=@project.pbugs.create(bug_params)
    @bug.update(:user_id=>current_user.id)
    if(@bug.save)
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end

    
  end

  def update
    @bug=Pbug.find(params[:id])
    @bug.update(bug_params)
    redirect_to action: "index"
    
    
  end

def resolve
    @bug=Pbug.find(params[:id])
    if(@bug.bugtype=='feature')
        @bug.update(:status=>'completed')
    else
        @bug.update(:status=>'solved')
    end   
    redirect_to action: "index"
end


  def destroy
      @bug=Pbug.find(params[:id])
      @bug.destroy
      redirect_to action: "index"
  end
  private

  def bug_params
    params.require(:pbug).permit(:title,:description,:deadline,:status,:bugtype,:image)
  end



end
