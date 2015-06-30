class RenameNoteComments < ActiveRecord::Migration
  def change
    rename_table :note_comments, :comments
  end
end
