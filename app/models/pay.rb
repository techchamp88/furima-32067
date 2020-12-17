class Pay

  include ActiveModel::Model
  attr_accessor :post_code, :shipper_id, :city, :address, :building, :tel_num, :token, :user_id, :item_id, :card_status, :month, :year, :security, :token

# ここにバリデーションの処理を書く

  with_options presence: true do
    validates :post_code,         format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :shipper_id,        numericality: { other_than: 1}
    validates :city
    validates :address
    validates :tel_num,           format: {with: /\A[0-9]{11}\z/}
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipper_id: shipper_id, city: city, address: address, building: building,tel_num: tel_num, user_item_id: user_item.id)
  end
end