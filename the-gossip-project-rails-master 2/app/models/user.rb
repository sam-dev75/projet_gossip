class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true, length: { in: 6..200 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :age, presence: true, numericality: { only_integer: true }
  validates :password, presence: true, length: { minimum: 6 }

  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :recipient_to_pm_links, foreign_key: 'recipient_id'
  has_many :received_messages, foreign_key: 'received_message_id', class_name: "PrivateMessage", through: :recipient_to_pm_links
  has_many :sub_comments
  has_many :comments
  has_many :likes

  has_secure_password
end
