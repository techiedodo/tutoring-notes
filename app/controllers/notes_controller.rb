class NotesController < ApplicationController
  before_action :authenticate_tutor!
  def index
    @sess = TutSession.find(params[:id])
    @notes = @sess.notes.all
  end

  def show

  end

  def new
  end

  def edit
  end
end
