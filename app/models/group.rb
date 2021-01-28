class Group < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :icon, presence: true
end
