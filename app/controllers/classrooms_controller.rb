class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @students = Student.all
  end

  def index
    @classrooms = Classroom.all
  end
end
