class SessionController < ApplicationController
  def new
    @teacher=Teacher.new
  end

  def create
    teacher = Teacher.find_by(email: params[:session][:email])
      if teacher && teacher.authenticate(params[:session][:password])
        redirect_to teacher_show_path, notice: "Login successful"
      else
        redirect_to session_new_path, notice: "Login unsuccessful"
      end
  end

  def destroy
  end


end
