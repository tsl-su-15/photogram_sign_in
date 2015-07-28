class Photo < ActiveRecord::Base
  validates :source, :caption, presence: true
  validates :caption, length: { maximum: 140 }

  belongs_to :user
  # def user
  #   return User.find(user_id)
  # end

  has_many :comments
  # def comments
  #   return Comment.where(:photo_id => id)
  # end
end
