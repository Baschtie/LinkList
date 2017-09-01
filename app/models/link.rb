class Link < ApplicationRecord
  validates :name, :presence => true
  validates :url, :presence => true
  validates :url, uniqueness: { scope: :belongs_to, :message => "Link is already stored" }
end
