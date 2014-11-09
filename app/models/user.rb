class User < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :students
  has_many :parents
  has_many :teachers
  has_many :district_superintendents

  def has_role?(role)
    relationship(role).count() > 0
  end

  def as_a(role)
    relationship(role).first
  end

  def relationship(type)
    relationship = type.to_s.pluralize.to_sym
    self.send(relationship)
  end
end
