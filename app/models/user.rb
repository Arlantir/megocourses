class User < ApplicationRecord
  extend FriendlyId

  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable
  
  after_create :assign_default_role
  
  has_many :courses
  has_many :enrollments

  validate :must_have_a_role, on: :update

  friendly_id :email, use: :slugged
  
  def to_s
    email
  end

  def username
    self.email.split(/@/).first if email.present?
  end

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher)
      self.add_role(:student)
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher)
    end
  end

  def online?
    updated_at > 2.minutes.ago
  end


  def buy_course(course)
    self.enrollments.create(course: course, price: course.price)
  end

  private

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, 'must have at least one role')
    end
  end
end
