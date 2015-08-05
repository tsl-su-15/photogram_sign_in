class Comment < ActiveRecord::Base

  belongs_to :user
  # def user
  #   return User.find(user_id)
  # end
  belongs_to :photo
end
