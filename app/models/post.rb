class Post < ApplicationRecord
  has_many_attached :image
  belongs_to :user
  has_rich_text :content
  acts_as_commontable
end
