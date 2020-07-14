class Course < ApplicationRecord
  extend FriendlyId
  
  belongs_to :user

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  has_rich_text :description

  friendly_id :title, use: :slugged
end
