class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_rich_text :content
  acts_as_commontable
  extend FriendlyId
  friendly_id :title, use: :slugged
end
