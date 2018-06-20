class Comment < ApplicationRecord
  #Model relation
  belongs_to :post
  #Requisite for creation
  validates :author, presence: true
  validates :content, presence: true
end
