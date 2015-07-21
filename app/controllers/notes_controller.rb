class NotesController < ApplicationController
	before_action :set_note_ivar, only: [:show,
																			 :edit,
																			 :update,
																			 :destroy,
																			 :add_tag,
																			 :remove_tag]

	# Shows all notes.
	def index
		@notes = Note.all
	end

	# Shows a specific note.
	def show
		@comment = @note.comments.build
		@comments_to_display = @note.comments.persisted
	end

  # Builds a new note.
  def new
		@project = Project.find(params[:project_id])
    @note = @project.notes.build
  end

  # Creates a new note in the database
  def create
		@project = Project.find(params[:project_id])
  	@note = @project.notes.build(note_params)

    if @note.save
	    flash[:success] = "Note saved."
	    redirect_to note_path(@note)
    else
	    render "new" # the error messages partial will do the rest
    end
  end

	def edit
		@project = @note.project
	end

	def update
		if @note.update(note_params)
			flash[:info] = "Note updated."
			redirect_to note_path(@note)
		else
			flash[:warning] = "Error updating note."
			redirect_to note_path(@note)
		end
	end

	def add_tag
		tag_string = params[:tag_string]
		@note.tag_list.add(tag_string, parse: true)

		unless @note.save
			flash[:warning] = "Error adding tag."
		end

		redirect_to note_path(@note)
	end

	def remove_tag
		# TODO: refactor this and add_tag, they're basically the same
		@tag_string = params[:tag_string]
		@note.tag_list.remove(@tag_string, parse: true)

		unless @note.save
			flash[:warning] = "Error removing tag."
		end

		respond_to do |format|
			format.html { redirect_to edit_note_path(@note) }
			format.js
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
        params.require(:note).permit(:title, :text, :tag_list) # Whitelist the params to prevent the params from passing any dangerous attributes
	    end

end
