class Todo < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true

	def self.test #class methods
		puts "Hi"
	end
end
