class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :amount, presence: true
  
end
