class Mentor < ActiveRecord::Base
	belongs_to :user
	has_many :matieres, dependent: :destroy
	has_many :reservations, dependent: :destroy
end
