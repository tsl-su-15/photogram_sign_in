class User < ActiveRecord::Base

  # pulls out associated photos
  def photos
    Photo.where(:user_id => id )
  end
end
