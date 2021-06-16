class Blog < ApplicationRecord
  validates :name, presence: true
  validates :article, presence: true, length: { maximum: 140 }
end

