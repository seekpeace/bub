class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :configure_permitted_parameters, if: :devise_controller?
 
	protected
  
  # @profile = current_user.profile

	def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  	devise_parameter_sanitizer.for(:account_update) << :name
	end

  protect_from_forgery with: :exception

  def current_profile
  	current_user.profile
  end

  helper_method :current_profile

  rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
	end
 
	def redirect_back_or(path)
  	redirect_to request.referer || path
	end
	
end
