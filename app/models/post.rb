class Post < ApplicationRecord
  has_one_attached :image, service: :s3
  belongs_to :user
end
