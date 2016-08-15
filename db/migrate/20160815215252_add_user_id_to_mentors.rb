class AddUserIdToMentors < ActiveRecord::Migration
  def change
    add_reference :mentors, :user, index: true, foreign_key: true
  end
end
