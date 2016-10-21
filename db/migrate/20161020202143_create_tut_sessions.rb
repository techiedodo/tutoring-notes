class CreateTutSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :tut_sessions do |t|
      t.text :session_name
      t.references :student, foreign_key: true, index: true

      t.timestamps
    end
  end
end
