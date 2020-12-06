class Item < ApplicationRecord
  belongs_to :user
  has_one    :user_item
  has_one_attached :image

  validates :name,            presence: true
  validates :explanation,     presence: true
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :delivery_fee_id, presence: true
  validates :shipper_id,      presence: true
  validates :delivery_day_id, presence: true
  validates :price,           presence: true
  validates :name,            presence: true
  validates :image,           presence: true
end
