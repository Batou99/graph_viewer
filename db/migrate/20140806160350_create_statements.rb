class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :subject
      t.string :object
      t.string :predicate
      t.timestamps
    end

    add_index :statements, :subject
    add_index :statements, :object
    add_index :statements, :predicate
  end
end
