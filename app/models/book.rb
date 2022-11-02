class Book < ApplicationRecord

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  belongs_to :user
  has_many :favorites, dependent: :destroy

  has_one_attached :profile_image


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
