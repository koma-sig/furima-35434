class Item < ApplicationRecord
  
  belongs_to :user
  has_one    :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :delivery_charge
  belongs_to :shipment
  belongs_to :shipping_days

  with_options presence: true do
    validates :image
    validates :product
    validates :product_description
  end

  with_options numericality: { other_than: 1 },presence: true do
    validates :category_id
    validates :product_status_id
    validates :delivery_charge_id
    validates :shipment_id
    validates :shipping_days_id
  end
  validates :price, presence: true, numericality:{ only_integer: true,greater_than_or_equal_to:300, less_than_or_equal_to:9999999}             
end
