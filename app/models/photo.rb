class Photo < ActiveRecord::Base
  validates :source, :caption, presence: true
  validates :caption, length: { maximum: 140 }

  def favorite(user)
    return Favorite.where(user_id: user.id, photo_id: id).first
  end

  belongs_to :user
  # def user
  #   return User.find(user_id)
  # end

  has_many :comments
  # def comments
  #   return Comment.where(:photo_id => id)
  # end
end
