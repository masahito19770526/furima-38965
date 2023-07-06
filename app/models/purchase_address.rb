class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :block_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id )
  end
end
