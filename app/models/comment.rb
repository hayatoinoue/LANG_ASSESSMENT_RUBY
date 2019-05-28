class Comment < ApplicationRecord
  validates :contributor_name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 255 }
end
