class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one    :user_item
  has_one_attached :image
  
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :shipper
  belongs_to :delivery_day




  validates :name,            presence: true
  validates :explanation,     presence: true
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :delivery_fee_id, presence: true
  validates :shipper_id,      presence: true
  validates :delivery_day_id, presence: true
  validates :price,           presence: true
  validates :image,           presence: true


  validates :category_id,     numericality: { other_than: 1 } 
  validates :status_id,       numericality: { other_than: 1 } 
  validates :delivery_fee_id, numericality: { other_than: 1 } 
  validates :shipper_id,      numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
end
