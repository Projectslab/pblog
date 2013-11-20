class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      # todo: redirect -> root_url когда будет список материалов доступных неавторизованным пользователям
      redirect_to login_url
    end
  end
end
