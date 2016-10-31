class TutSessionsController < ApplicationController
  before_action :authenticate_tutor!
  def index
    @tsessions = current_tutor.tut_sessions.paginate(page: params[:page], per_page: 12)
    authorize @tsessions
  end

  def show
    @tsession = TutSession.find(params[:id])
    authorize @tsession
  end

  def new
    @student = Student.find(params[:student_id])
    @tsession =TutSession.new
    authorize @tsession
  end

  def create
    @tsession = TutSession.new(session_params)
    authorize @tsession
    if @tsession.save
      flash[:notice] = "New tutoring session created."
      redirect_to @tsession
    else
      flash.now[:error] = "There was an error creating a new session. Please try again."
      render :new
    end
  end

  def edit
    @tsession = TutSession.find(params[:id])
    authorize @tsession
  end

  def update
    @tsession = TutSession.find(params[:id])
    authorize @tsession
    if @tsession.update_attributes(session_params)
      flash[:notice] = "Session file updated."
      redirect_to @tsession
    else
      flash.now[:error] = "There was an error updating the session. Please try again."
      render :new
    end
  end

  def destroy
    @tsession = TutSession.find(params[:id])
    if @tsession.destroy
      flash[:notice] = "Session \"#{@tsession.session_name}\" was removed successfully."
      redirect_to tut_sessions_path
    else
      flash[:error] = "There was a mistake removing the tutoring session. Please try again."
      render :show
    end
  end

  private
    def session_params
      params.require(:tut_session).permit(:session_name, :student_id)
    end
end
