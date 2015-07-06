class AddProjectRefToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :project, index: true, foreign_key: true
  end
end
