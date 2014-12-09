class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 관리자 여부 확인
  def require_admin
    unless current_developer && current_developer.admin
      redirect_to root_path
      flash[:admin_not] = "You are not an admin"
    end        
  end

  # 유저의 로그인 여부 확인
  def require_sign_in
    unless current_developer
      redirect_to new_developer_session_path, notice: "로그인이 필요합니다."
      flash[:sign_in] = "로그인이 필요합니다."
    end        
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :name, :cname, :dname, :field) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :name, :cname, :dname, :field) }
    end
end
