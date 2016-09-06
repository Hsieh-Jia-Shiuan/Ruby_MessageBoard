class User < ActiveRecord::Base
	has_many :comments
	has_many :posts

	validates :name, presence: true
	validates :name, presence: true

	validates :name, length: {minimum: 2}
	validates :name, length: {maximum: 100}
end