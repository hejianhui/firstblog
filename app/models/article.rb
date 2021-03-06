class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :tag_list
  attr_accessible :title
  attr_accessible :text
  has_many :comments, dependent: :destroy
  acts_as_taggable

  validates :user_id, presence: true
  #validates :content, presence: true
  validates :title, presence: true,
    length: { minimum: 5 }
end
