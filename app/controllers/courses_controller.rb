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
    respond_to do |format|
      format.html {
        @course = Course.new(course_params)
        if @course.save
          if params[:course][:cover].present?
            render 'crop'
          else
            redirect_to @course
          end
        end
      }
      format.js { @course = Course.create(course_params) }
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
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
def course_params
  params.require(:course).permit(:name, :cover, :crop_x, :crop_y, :crop_w, :crop_h)
end
