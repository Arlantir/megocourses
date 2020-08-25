class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[show edit update destroy]

  def index
    @enrollments = Enrollment.all
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def edit
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    @enrollment.price = @enrollment.course.price

    if @enrollment.save
      redirect_to @enrollment, notice: 'Enrollment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @enrollment.update(enrollment_params)
      redirect_to @enrollment, notice: 'Enrollment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @enrollment.destroy
    
    redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.'
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  def enrollment_params
    params.require(:enrollment).permit(:course_id, :user_id, :rating, :review)
  end
end
