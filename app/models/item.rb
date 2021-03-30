class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :product_name
    validates :description
    validates :category_id
    validates :status_id 
    validates :burden_id
    validates :area_id
    validates :delivery_id
    validates :price
    validates :user
  end
  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :area
  belongs_to :delivery
  belongs_to :user
end
