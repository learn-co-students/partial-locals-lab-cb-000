class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
  #  @student = @classroom.students.first
  end

  def index
    @classrooms = Classroom.all
  end
end
