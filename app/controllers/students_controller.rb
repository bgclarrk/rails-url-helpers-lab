class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
  end

  def activate_student
    @student = set_student
    @student.active ? @student.active = false : @student.active = true
    @student.save
    
    redirect_back fallback_location: @student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end