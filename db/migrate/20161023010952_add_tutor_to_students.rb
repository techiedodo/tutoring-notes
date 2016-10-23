class AddTutorToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :tutor_id, :integer
    add_index :students, :tutor_id
  end
end
