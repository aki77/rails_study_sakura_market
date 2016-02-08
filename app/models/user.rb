class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :nickname, presence: true, length: { maximum: 20 }

  attachment :profile_image, type: :image

  has_many :diaries, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
end
