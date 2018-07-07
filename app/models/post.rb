class Post < ApplicationRecord
  #Requisite for model creation
  validates :title, presence: true
  validates :content, presence: true
  enum status: [ :project, :working, :completed ]
  #Relation between models
  has_many :comments, dependent: :delete_all
  #Adding images to the model with Active Storage
  has_one_attached :cover
  has_many_attached :images

  #Instead of ID's param in URL
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
    # TODO
    # => Array of posts
  end

end
