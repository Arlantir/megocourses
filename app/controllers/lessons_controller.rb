class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: %i(new create show edit update destroy)

  def index
    @lessons = Lesson.all
  end

  def show
    authorize @lesson
  end

  def new
    @lesson = Lesson.new
  end

  def edit
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @course = Course.friendly.find(params[:course_id])
    @lesson.course_id = @course.id

    authorize @lesson

    if @lesson.save
      redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @lesson

    if @lesson.update(lesson_params)
      redirect_to course_lesson_path(@course, @lesson), notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @lesson
    @lesson.destroy

    redirect_to course_path(@course), notice: 'Lesson was successfully destroyed.'
  end

  private
    
    def set_lesson
      @lesson = Lesson.friendly.find(params[:id])
    end

    def set_course
      @course = Course.friendly.find(params[:course_id])
    end

    def lesson_params
      params.require(:lesson).permit(:title, :content)
    end
end
