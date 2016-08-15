class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :matiere, index: true, foreign_key: true
      t.references :mentor, index: true, foreign_key: true
      t.date :date

      t.timestamps null: false
    end
  end
end
