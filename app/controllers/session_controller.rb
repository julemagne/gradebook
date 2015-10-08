class SessionController < ApplicationController
  def new

  end

  def create
    if Teacher.find_by_email(params[:email])
    teacher = Teacher.find_by_email(params[:session][:email])
      if teacher && teacher.authenticate(params[:session][:password])
        session[:teacher_id]=teacher.id
        redirect_to teachers_path, notice: "Login successful"
      else
        redirect_to session_new_path, alert: "Login unsuccessful"
      end
    elsif Parent.find_by_email(params[:email])
    parent = Parent.find_by_email(params[:session][:email])
      if parent && parent.authenticate(params[:session][:password])
        session[:parent_id]=parent.id
        redirect_to parents_path, notice: "Login successful"
      else
        redirect_to session_new_path, alert: "Login unsuccessful"
      end
    elsif Student.find_by_email(params[:email])
    student = Student.find_by_email(params[:session][:email])
      if student && student.authenticate(params[:session][:password])
        session[:student_id]=student.id
        redirect_to students_path, notice: "Login successful"
      else
        redirect_to session_new_path, alert: "Login unsuccessful"
      end
    else
      redirect_to session_new_path, alert: "Login unsuccessful"
    end
  end

  def destroy
    session[:teacher_id]=nil
    redirect_to root_path, alert: "Logged out"
  end

end
