class User < ApplicationRecord
  has_many :transactions
  has_many :groups
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '50x50>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}
  validates_attachment :avatar, presence: true
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :username, uniqueness: true
end
