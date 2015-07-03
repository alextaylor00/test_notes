class CreateScaffoldTests < ActiveRecord::Migration
  def change
    create_table :scaffold_tests do |t|
      t.string :text
      t.integer :score

      t.timestamps null: false
    end
  end
end
