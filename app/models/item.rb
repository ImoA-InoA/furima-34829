class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :burden_id
      validates :area_id
      validates :delivery_id
    end
    validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery
  belongs_to :user
end
