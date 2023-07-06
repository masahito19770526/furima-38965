class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase 
  has_one_attached :image 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_type
  belongs_to :prefecture
  belongs_to :delivery_date

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :status_id
    validates :category_id
    validates :delivery_type_id
    validates :prefecture_id
    validates :delivery_date_id
  end
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 } 
  end 
end
