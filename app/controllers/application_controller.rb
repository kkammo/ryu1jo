class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # 관리자 여부 확인
  def require_admin
    unless current_developer && current_developer.admin
      redirect_to root_path
      flash[:admin_not] = "You are not an admin"
    end        
  end

  # 유저의 로그인 여부 확인
  def require_log_in
    unless current_developer
      redirect_to root_path
      flash[:sign_in] = "로그인이 필요합니다."
    end        
  end

end
