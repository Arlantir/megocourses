class Course < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, _model| controller.current_user }

  LANGUAGES = %i[English Russian Polish].freeze
  LEVELS = %i[Beginner Itermediate Advanced].freeze
  
  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :enrollments

  validates :title, :short_description, :language, :price, :level, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  has_rich_text :description

  friendly_id :title, use: :slugged

  def to_s
    title
  end

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end

  def bought(user)
    self.enrollments.where(user_id: [user.id], course_id: [self.id].empty?)
  end
end
