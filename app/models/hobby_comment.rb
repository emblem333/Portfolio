class HobbyComment < ApplicationRecord
  belongs_to :user
  belongs_to :hobby

  validates :comment, presence: true
end
