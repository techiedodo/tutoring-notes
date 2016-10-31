class StudentsController < ApplicationController
  before_action :authenticate_tutor!
  def index
    @students = policy_scope(Student)
    authorize @students
  end

  def show
    @student = Student.find(params[:id])
    @stu_sess = @student.tut_sessions.paginate(page: params[:page], per_page: 8)
    authorize @student
  end

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @student = Student.new(student_params)
    @student.tutor = current_tutor
    authorize @student
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
    authorize @student
  end

  def update
    @student = Student.find(params[:id])
    authorize @student
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
