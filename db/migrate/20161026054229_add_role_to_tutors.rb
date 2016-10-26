class AddRoleToTutors < ActiveRecord::Migration[5.0]
  def change
    add_column :tutors, :role, :string, :default => 'tutor'
  end
end
