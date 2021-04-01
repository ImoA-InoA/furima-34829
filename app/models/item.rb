class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :burden_id, numericality: { other_than: 1 }
    validates :area_id, numericality: { other_than: 1 }
    validates :delivery_id, numericality: { other_than: 1 }
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, message: "is invalid"}
  end
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery
  belongs_to :user
end
