class Matiere < ActiveRecord::Base
	belongs_to :mentor
	has_many :reservations, dependent: :destroy
end
