class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
  end

  def create
    @course = Course.new(course_params)
    @course.image_data = params[:course][:cover]
    @course.save
  end

  def edit
  end

  def update
    if @course.update(course_params)
      if params[:course][:cover].present?
        render 'crop'
      else
        redirect_to @course
      end
    else
      render 'new'
    end
  end
end

private

def find_course
  @course = Course.find(params[:id])
end

def course_params
  params.require(:course).permit(:name, :cover, :crop_x, :crop_y, :crop_w, :crop_h)
end
