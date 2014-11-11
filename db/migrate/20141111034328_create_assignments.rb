class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :project, index: true
      t.references :user, index: true

      t.string :role
      t.timestamps
    end
  end
end
