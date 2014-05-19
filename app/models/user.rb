class User < ActiveRecord::Base
	validates :mailid , presence: true , uniqueness: true , length: { minimum: 5 }
	validates :password , presence: true , length: { minimum: 6}
	
end
