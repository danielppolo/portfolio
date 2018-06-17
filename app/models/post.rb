class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  enum status: [ :done, :working, :project ]
  has_many :comments, dependent: :destroy
  has_many_attached :images

  #Instead of ID's param
  def to_param
    title
  end

  #Methods
  def reading_time
    words = self.content.split(" ").count
    time = (words.fdiv(200).round(1))*60.round
    minutes = time.div(60)
    "#{minutes} min read"
  end

  def self.categories
    all_cats = []
    Post.all.each do |post|
      post.categories.split(",").each do |category|
        all_cats << category
      end
    end
    all_cats.uniq
  end

  def self.search_by_category
    # => Array of posts
  end

end
