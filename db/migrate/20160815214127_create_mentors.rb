class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :FirstName
      t.string :LastName
      t.text :Presentation
      t.date :Birthday

      t.timestamps null: false
    end
  end
end
