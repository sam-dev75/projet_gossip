class Tag < ApplicationRecord
  validates :title, presence: true
  
  has_many :tag_gossip_links
  has_many :gossips, through: :tag_gossip_links
end
