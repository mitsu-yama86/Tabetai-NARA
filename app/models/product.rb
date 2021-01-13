class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :origin

  belongs_to :user
  has_many :comments

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name, length: { maximum: 20 }
    validates :brand
    validates :origin_id, numericality: { other_than: 1 }
    validates :text, length: { maximum: 1000}
  end
end
