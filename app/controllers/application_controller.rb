class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?
  
protected
def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) << :name << :project_id << :user_type
end
     protect_from_forgery with: :exception

def after_sign_in_path_for(resource)
    '/projects'     
end

#def after_sign_out_path_for(resource)
# 'users/sign_in'
#end

def after_sign_up_path_for(resource)
    '/projects'     
end

end

