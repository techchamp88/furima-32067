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


  VALID_PRICE = /\A^[0-9]+$\z/

  with_options presence: true do

    validates :name            
    validates :explanation     
    validates :category_id     
    validates :status_id       
    validates :delivery_fee_id 
    validates :shipper_id      
    validates :delivery_day_id 
    validates :price,           format: { with: VALID_PRICE }
    validates :image                      

  end

  with_options numericality: { other_than: 1 } do

    validates :category_id     
    validates :status_id       
    validates :delivery_fee_id 
    validates :shipper_id      
    validates :delivery_day_id 

  end

  validates_inclusion_of :price, in: 300..9999999

end
