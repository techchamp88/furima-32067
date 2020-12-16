class Pay

  include ActiveModel::Model
  attr_accessor :post_code, :shipper, :city, :address, :building, :tel_num, :token

# ここにバリデーションの処理を書く
  validates :building

  with_options presence: true do
    validates :post_code,         format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipper,           numericality: { other_than: 1}
    validates :city
    validates :address
    validates :tel_numormat:      format: {with: /\A[0-9]{11}\z/}
    validates :shipper,           numericality: { other_than: 1}

    validates :token

    
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    Address.create(post_code: post_code, shipper: shipper, city: city, address: address, building: building, user_item_id: user_item.id)
  end
end