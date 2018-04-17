class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    # binding.pry

    @student = @classroom.oldest_student


  end

  def index
    @classrooms = Classroom.all
  end
end
