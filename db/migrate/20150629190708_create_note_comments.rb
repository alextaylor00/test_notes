class CreateNoteComments < ActiveRecord::Migration
  def change
    create_table :note_comments do |t|

      t.text :text
      t.references :note, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
