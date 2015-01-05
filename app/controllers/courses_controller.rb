class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.create(course_params)
  end
end

private
def course_params
  params.require(:course).permit(:name, :cover)
end
