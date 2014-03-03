class Employee < ActiveRecord::Base
	has_many :evaluations
	validates :name, :position, :hireDate, :wage, presence: true
end
