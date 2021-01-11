class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :bland

  belongs_to :user
  has_many :comments

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :brand
    validates :origin_id, numericality: { other_than: 1 }
    validates :text
  end
end
