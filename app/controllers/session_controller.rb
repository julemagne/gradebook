class SessionController < ApplicationController
  def new

  end

  def create
    teacher = Teacher.find_by_email(params[:session][:email])
      if teacher && teacher.authenticate(params[:session][:password])
        session[:logged_in_teacher]=true #put teacher_id: :id in session hash 
        redirect_to teacher_show_path, notice: "Login successful"
      else
        redirect_to session_new_path, alert: "Login unsuccessful"
      end
  end

  def destroy
    session[:logged_in_teacher]=false
    redirect_to root_path, alert: "Logged out"
  end

end
