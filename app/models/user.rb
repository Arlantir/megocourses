class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable
  
  has_many :courses
  
  def to_s
    email
  end

  def username
    self.email.split(/@/).first if email.present?
  end
end
