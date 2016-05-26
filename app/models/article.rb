class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  validates :user_id, presence: true
  #validates :content, presence: true
  validates :title, presence: true,
    length: { minimum: 5 }
end
