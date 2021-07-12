class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one_attached :icon
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  paginates_per 3

  scope :index_all, -> {
    select(:id, :email, :name, :last_sign_in_at, :created_at)
      .order(created_at: :asc)
      .includes(:blogs)
  }
end
