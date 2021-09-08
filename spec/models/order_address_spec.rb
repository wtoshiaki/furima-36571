require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @user_item = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '必須項目が入力されていれば購入できること' do
        expect(@user_item).to be_valid
      end
      it '建物名の記述がなくても購入できること' do
        @user_item.building = ''
        expect(@user_item).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'postal_codeが空だと購入できない' do
        @user_item.postal_code = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @user_item.postal_code = "1234567"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'item_prefecture_idが未選択だと購入できない' do
        @user_item.item_prefecture_id = 0
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @user_item.city = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @user_item.house_number = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @user_item.phone_number = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁では購入できない' do
        @user_item.phone_number = "090123456"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)") 
      end
      it 'phone_numberが12桁では購入できない' do
        @user_item.phone_number = "090123456789"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)") 
      end
      it 'phone_numberが全角数字だと登録できないとき' do
        @user_item.phone_number = "０９０１２３４５６７"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number Input only number")
      end
      it 'userが紐付いていないと保存できないこと' do
        @user_item.user_id = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @user_item.item_id = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
