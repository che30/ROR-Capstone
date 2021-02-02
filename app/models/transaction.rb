class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :amount, presence: true
end
