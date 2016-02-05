class Diary < ActiveRecord::Base
  attachment :diary_image, type: :image

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
