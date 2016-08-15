class CreateMatieres < ActiveRecord::Migration
  def change
    create_table :matieres do |t|
      t.string :Name
      t.text :Presentation

      t.timestamps null: false
    end
  end
end
