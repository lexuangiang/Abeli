class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameter, if: :devise_controller?

  def bmi_cal
    unless !user_signed_in?
      user = current_user
      bmi = user.weight/user.height**2
    end
  end
  def result_bmi
    case bmi_cal
      when 0..18.5 then "thiếu cân, thiếu năng lượng trường diễn"
      when 18.5..22.99 then "bình thường"
      when 22.99..24.99 then "thừa cân "
      else "béo phì"
    end
  end
  protected

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit :sign_up, keys: [:fullname]
    devise_parameter_sanitizer.permit :account_update, keys: [:fullname, :height, :weight]
  end
end
