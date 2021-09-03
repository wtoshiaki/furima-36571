require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報入力' do

    context '商品情報入力がうまくいくとき' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
      it "priceが300ちょうどだと登録できること" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "priceが9999999だと登録できること" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品情報の入力がうまくいかないとき' do
      it 'imageが空だと登録できないとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空だと登録できないとき' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'introductionが空だと登録できないとき' do
        @item.introduction =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'category_idが未選択だと登録できないとき' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが未選択だと登録できないとき' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'fee_idが未選択だと登録できないとき' do
        @item.fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'item_prefecture_idが未選択だと登録できないとき' do
        @item.item_prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'shipping_idが未選択だと登録できないとき' do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'priceが空だと登録できないとき' do
        @item.price =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角数字だと登録できないとき' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end  
      it "priceが299以下だと登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      
      it "priceが10000000だと登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
