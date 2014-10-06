class User < ActiveRecord::Base
	has_secure_password
	#Secure password is a special method to set password...works with BCrypt.

    validates :email, uniqueness: true, length: { minimum: 7 } 
    validates :mobile, numericality: true, length: {minimum: 10}


end
