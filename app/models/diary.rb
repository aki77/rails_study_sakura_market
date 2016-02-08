class Diary < ActiveRecord::Base
  attachment :diary_image, type: :image

  belongs_to :user
  has_many :goods, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  def was_good?(user)
    goods.exists?(user: user)
  end
end
