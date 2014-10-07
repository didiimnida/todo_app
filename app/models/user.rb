class User < ActiveRecord::Base
	has_secure_password
	has_many :todos
    validates :email, uniqueness: true, length: { minimum: 7 } 
    validates :mobile, numericality: true, length: {minimum: 10}

end
