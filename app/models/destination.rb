class Destination < ActiveRecord::Base
  validates :user_id, presence: true
  validates :name, presence: true
  validates :address, presence: true

  belongs_to :user
end
