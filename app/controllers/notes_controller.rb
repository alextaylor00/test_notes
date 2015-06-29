class NotesController < ApplicationController

	# Shows all notes.
	def index
		@notes = Note.all

	end

	# Shows a specific note.
	def show
        @note = Note.find(params[:id])
	end

    # Builds a new note.
    def new
        @note = Note.new
    end

    # Creates a new note in the database
    def create
        @note = Note.new(note_params)

        if @note.save
            flash[:success] = "Note saved."
            redirect_to notes_path
        else
            render 'new' # the error messages partial will do the rest
        end

    end

    private
        def note_params
            params.require(:note).permit(:title, :text) # whitelist the params to prevent the params from passing any dangerous attributes
        end

end
