class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_teacher #EVERY page/action would run this before loading, so ALL views would have access to the instance variable @logged_in_teacher

  private

  def logged_in?
    redirect_to session_path, notice: "You must be logged in to view this page" unless session[:logged_in_teacher]
  end

  def set_current_teacher
    @logged_in_teacher = Teacher.find_by_id(session[:teacher_id])
  end

end
