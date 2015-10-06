class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :assignment_name
      t.string :grade
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
