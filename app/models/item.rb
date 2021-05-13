class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :purchase
  has_one_attached :image
  
  belongs_to :category
  belongs_to :product_status
  belongs_to :delivery_charge
  belongs_to :shipment
  belongs_to :shipping_days

  validates :image,               presence: true
  validates :product,             presence: true
  validates :product_description, presence: true
  validates :category_id,         numericality: { other_than: 1 },presence: true
  validates :product_status_id,   numericality: { other_than: 1 },presence: true
  validates :delivery_charge_id,  numericality: { other_than: 1 },presence: true
  validates :shipment_id,         numericality: { other_than: 1 },presence: true
  validates :shipping_days_id,    numericality: { other_than: 1 },presence: true
  validates :price, presence: true, numericality:{ only_integer: true,greater_than_or_equal_to:300, less_than_or_equal_to:9999999}             
end
