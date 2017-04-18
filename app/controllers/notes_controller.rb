class NotesController < ApplicationController

  def index

  end

  def new
    @note = Note.new
    @team = current_user.current_team
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if current_user.current_team
      @note.team_id = current_user.current_team.id # nil
    end

    if @note.save
      flash[:notice] = "Note Created!"
      redirect_to team_path(current_user.current_team.id)
    else
      flash[:error] = "Error in creating the Topic.  Try Again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end


  private

  def note_params
    params.require(:note).permit(:content)
  end

end
