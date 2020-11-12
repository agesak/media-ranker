class Vote < ApplicationRecord
  validates :user_id, uniqueness: {scope: [:work_id]}

  belongs_to :user
  belongs_to :work
end
