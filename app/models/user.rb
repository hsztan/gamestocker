class User < ActiveRecord::Base
  has_many :consoles
  has_many :games

end
