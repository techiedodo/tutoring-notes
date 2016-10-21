class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "New student added successfully."
      redirect_to @student
    else
      flash.now[:error] = "There was an error creating a new student. Please try again."
      render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(student_params)
      flash[:notice] = "Student file updated."
      redirect_to @student
    else
      flash.now[:error] = "There was an error updating student. Please try again."
      render :new
    end
  end

  private
    def student_params
      params.require(:student).permit(:name, :bio)
    end
end
