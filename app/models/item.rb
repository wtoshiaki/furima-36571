class Item< ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
     belongs_to :category
     belongs_to :status
     belongs_to :fee
     belongs_to :shipping
     belongs_to :item_prefecture
     
   
   belongs_to :user
  #  has_one :order

   has_one_attached :image

  validates :title
  validates :introduction
  validates :category_id
  validates :status_id
  validates :fee_id
  validates :shipping_id
  validates :item_prefecture_id
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image

  validates :category_id, :status_id, :fee_id, :shipping_id, :item_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  
end
