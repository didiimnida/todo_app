class User < ActiveRecord::Base
	has_secure_password
	has_many :todos

    validates :email,
		presence: true,
		uniqueness: {case_sensitive: false},
		:format => {:with => /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/}

    validates :mobile, numericality: true, length: {minimum: 10}

    validates :password,
		presence: true,
		confirmation: true,
		length: {minimum: 6},
		on: :create

end
