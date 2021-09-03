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

  validates :title, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :fee_id, presence: true
  validates :shipping_id, presence: true
  validates :item_prefecture_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :image, presence: true

  validates :category_id, :status_id, :fee_id, :shipping_id, :item_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  
end
