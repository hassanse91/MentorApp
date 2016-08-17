class Reservation < ActiveRecord::Base
  belongs_to :matiere
  belongs_to :mentor
  belongs_to :student
end
