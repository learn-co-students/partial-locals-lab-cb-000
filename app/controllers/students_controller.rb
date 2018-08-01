class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    if params[:student_name]
      @students = search_students(params[:student_name])
      @student_name = params[:student_name]
    else
      @students = Student.all
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end

  def search_students(student_name)
    students = Student.where(name: student_name)
    students.empty? ? nil : students
  end

end
