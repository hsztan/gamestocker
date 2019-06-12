class User < ActiveRecord::Base
  has_many :games
  has_many :consoles, through: :games
  has_secure_password

end
