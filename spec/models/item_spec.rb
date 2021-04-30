require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do

      context '内容に問題がある場合' do
        it "imageがない場合は登録できないこと" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "titleがない場合は登録できないこと" do
          @item.title = nil
          @item.valid?
          expect(@item.errors[:title]).to include("can't be blank")
        end

        it "descriptionがない場合は登録できないこと" do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it "category_idがない場合は登録できないこと" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category is not a number")
        end

        it "category_idが0の場合は登録できないこと" do
          @item.category_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 0")
        end

        it "status_idがない場合は登録できないこと" do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status is not a number")
        end

        it "status_idが0の場合は登録できないこと" do
          @item.status_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 0")
        end

        it "delivery_charge_idがない場合は登録できないこと" do
          @item.delivery_charge_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge is not a number")
        end

        it "delivery_charge_idが0の場合は登録できないこと" do
          @item.delivery_charge_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
        end

        it "prefecture_idがない場合は登録できないこと" do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture is not a number")
        end

        it "prefecture_idが0の場合は登録できないこと" do
          @item.prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
        end

        it "delivery_date_indication_idがない場合は登録できないこと" do
          @item.delivery_date_indication_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date indication is not a number")
        end

        it "delivery_date_indication_idが0の場合は登録できないこと" do
          @item.delivery_date_indication_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery date indication must be other than 0")
        end

        it "priceがない場合は登録できないこと" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it "priceが300より小さいと登録できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it "priceが9999999より大きいと登録できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it "priceが半角数字でないと登録できない" do
          @item.price = "１２３４５"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it "priceが半角英数混合では登録できないこと" do
          @item.price = "123abc"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it "priceが半角英語だけでは登録できないこと" do
          @item.price = "abcdefg"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      end

      context '内容に問題ない場合' do

        it "必須項目が全てあれば登録できること" do
          @item = FactoryBot.build(:item)
          expect(@item).to be_valid
        end

        it "priceが300ちょうどだと登録できる" do
          @item.price = 300
          expect(@item).to be_valid
        end

        it "priceが9999999だと登録できる" do
          @item.price = 9999999
          expect(@item).to be_valid
        end
      end
    end
  end
end
 