class User < ActiveRecord::Base
	has_many :comments
	has_many :posts

	validates :name, presence: true, uniqueness: true
	validates :password_digest, presence: true, on: :create, length: {minimum: 5}

	validates :name, length: {minimum: 2}
	validates :name, length: {maximum: 100}

	has_secure_password validations: false
end