class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:name, :birth_day, :first_name, :family_name, :first_name_kana, :family_name_kana]
    )
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'kuzukuzu' && password == '0461'
    end
  end
end
