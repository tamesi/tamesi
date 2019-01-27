class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
def after_sign_in_path_for(resource)
 		user_path(current_user.id)
end

def after_sign_out_path_for(resource)
 		home_path
end

protected

def configure_permitted_parameters
      # sign_upのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])

      devise_parameter_sanitizer.permit(:log_in, keys: [:name, :email])

      # account_updateのときに、nameをストロングパラメータに追加する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
end
end


