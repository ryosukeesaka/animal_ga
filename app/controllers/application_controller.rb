class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
        case resource
      		when Admin
        		   admins_users_path
      		when User
        		   posts_path
        end
    end


 	protected
 	def configure_permitted_parameters
 		added_attrs = [:last_name,:first_name,:first_name_kana,:last_name_kana,:introduction,:phone_number,:Image,:email,:prefecture]
   		devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)

   		devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
 	end
end
