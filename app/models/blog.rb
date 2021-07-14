class Blog < ApplicationRecord
  validates :name, presence: true
  validates :article, presence: true, length: { maximum: 140 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  paginates_per 10

  scope :index_all, -> {
    select(:id, :name, :article, :created_at, :user_id)
      .order(created_at: :asc)
      .includes(:user, :comments)
  }
end

