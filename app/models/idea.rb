class Idea < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :user
  belongs_to :category
end
