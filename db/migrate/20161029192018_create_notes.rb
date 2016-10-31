class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.text :summary
      t.text :achievement
      t.text :next_sess
      t.text :recommendation
      t.integer :trip_dist
      t.integer :rate
      t.string :add_rate
      t.time :t_start
      t.time :t_finish
      t.date :sess_date
      t.references :tut_session, foreign_key: true, index: true

      t.timestamps
    end
  end
end
