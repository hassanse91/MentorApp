class AddStudentIdToReservation < ActiveRecord::Migration
  def change
    add_reference :reservations, :student, index: true, foreign_key: true
  end
end
