class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_one_attached :icon
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #user.favoritesで実行されるSQL
  #SELECT `favorites`.* FROM `favorites` WHERE `favorites`.`user_id` = 6
  has_many :favorite_blogs, through: :favorites, source: :blog # foreign_key: user_id が省略されている
  # user_id == id になるすべてのレコードをBlog::ActiveRecord_Associations_CollectionProxyクラスで返却する。
  # 一方、user.favorite_blogs.first.classはBlogになる。
  #
  # user.favorite_blogsの結果で実行されるSQL
  # テーブル結合が行われてからblogsをuser_idで検索する
  # SELECT `blogs`.* FROM `blogs` INNER JOIN `favorites` ON `blogs`.`id` = `favorites`.`blog_id` WHERE `favorites`.`user_id` = 6
  #
  # source:を:userに変更して実行されるSQL
  # SELECT `users`.* FROM `users` INNER JOIN `favorites` ON `users`.`id` = `favorites`.`user_id` WHERE `favorites`.`user_id` = 6
  #
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  # SELECT `relationships`.* FROM `relationships` WHERE `relationships`.`follower_id` = 6
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed # foreign_key: user_id,でfollowedに自分のidがあるレコードのみを取得
  # SELECT `users`.* FROM `users` INNER JOIN `relationships` ON `users`.`id` = `relationships`.`followed_id` WHERE `relationships`.`follower_id` = 6
  has_many :followers, through: :passive_relationships, source: :follower #

  #belongs_to, has_manyのメソッドで使われる foreign_keyオプションは それぞれ意味が違う
  # belongs_to は参照先を参照するためにそのテーブルが持っている外部キーを指定するオプション
  # has_many は参照元（今回はrelation, favoriteなど)のテーブルに定義されている外部キーを指定するオプション.
  #   指定した外部キーidと自身のidを比較し、一致したものをhas_manyで返す
  paginates_per 3

  scope :index_all, -> {
    select(:id, :email, :name, :last_sign_in_at, :created_at)
      .order(created_at: :asc)
      .includes(:blogs)
  }
end
