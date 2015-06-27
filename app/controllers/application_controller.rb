class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :handle_cookies
  before_action :configure_permitted_parameters, if: :devise_controller?

  def handle_cookies
    I18n.locale = cookies[:lang] || I18n.default_locale 
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:tel, :name, :job, :country,
      :admin_setting_education_id, :admin_setting_experience_id, :admin_setting_industry_id,
      :summmary]
    devise_parameter_sanitizer.for(:account_update) << [:tel, :name, :job, :country,
      :admin_setting_education_id, :admin_setting_experience_id, :admin_setting_industry_id,
      :summmary]
  end
end