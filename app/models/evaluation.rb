class Evaluation < ActiveRecord::Base
	belongs_to :employee

	validates :body, presence: true
	validates :employee_id, presence: true

end
