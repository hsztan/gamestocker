class User < ActiveRecord::Base
  has_many :games
  has_many :consoles
  has_secure_password

end
