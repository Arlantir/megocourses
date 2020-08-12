class Lesson < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, _model| controller.current_user }

  belongs_to :course

  validates :title, :content, :course, presence: true

  friendly_id :title, use: :slugged

  def to_s
    title
  end
end
