class NotesController < ApplicationController
	before_action :set_note_ivar, only: [:show, :edit, :update, :destroy]

	# Shows all notes.
	def index
		@notes = Note.all
	end

	# Shows a specific note.
	def show
		@comment = @note.comments.build
	end

  # Builds a new note.
  def new
		@project = Project.find(params[:project_id])
    @note = @project.notes.build
  end

  # Creates a new note in the database
  def create
  	@note = Note.new(note_params)

    if @note.save
	    flash[:success] = "Note saved."
	    redirect_to note_path(@note)
    else
			@project = Project.find(params[:project_id])
	    render "new" # the error messages partial will do the rest
    end
  end

	def edit
	end

	def update
		if @note.update(note_params)
			redirect_to note_path(@note), notice: "Success!"
		else
			redirect_to note_path(@note), notice: "Error updating note"
		end

	end

	def destroy
		if @note.destroy
			redirect_to project_path(@note.project), notice: "Note deleted."
		end
	end

	  private
			def set_note_ivar
				@note = Note.find(params[:id])
			end

	    def note_params
        params.require(:note).permit(:project, :title, :text) # Whitelist the params to prevent the params from passing any dangerous attributes
	    end

end
