class Good < ActiveRecord::Base
  validates :diary_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :diary
end
