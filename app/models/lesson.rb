class Lesson < ApplicationRecord
  extend FriendlyId

  belongs_to :course

  validates :title, :content, :course, presence: true

  friendly_id :title, use: :slugged
end
