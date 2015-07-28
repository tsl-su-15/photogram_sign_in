class User < ActiveRecord::Base

  has_many :photos
  # def photos
  #   Photo.where(:user_id => id )
  # end
end
