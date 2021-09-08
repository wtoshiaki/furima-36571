class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :item_prefecture_id, :city, :house_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, numericality: { only_integer: true, message: "Input only number"}, length: { in: 10..11 }
    validates :token
  end
  validates :item_prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save

    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, house_number: house_number, building: building, phone_number:  phone_number,order_id: order.id)
  end
end