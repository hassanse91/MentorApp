class AddMentorIdToMatieres < ActiveRecord::Migration
  def change
    add_reference :matieres, :mentor, index: true, foreign_key: true
  end
end
