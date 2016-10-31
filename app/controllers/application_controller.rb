class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_tutor!, :except => [:index]

  rescue_from Pundit::NotAuthorizedError do |exception|
    redirect_to root_url, alert: exception.message
  end
  # rescue_from NoMethodError do
  #   redirect_to root_url, alert: 'Please login to continue.'
  # end
  # this will allow the use of current_tutor when using Pundit. Application Policy remains unchanged and user is still used.
  def pundit_user
    current_tutor
  end

  def after_sign_in_path_for(tutor)
    students_path
  end

   protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :subjects])
   end
end
