require 'rails_helper'
RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.create(:item) }
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品機能がうまくいくとき' do
      it "image,name,explanation,category_id,status_id,delivery_fee_id,shipper_id,delivery_day_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end

      it  "価格の範囲が300~9999999であり、半角英数字である"do
        @item.price = 400
        expect(@item).to be_valid
      end

      it "必要な情報を適切に入力すると、商品の出品ができること" do
        expect(@item).to be_valid
      end

      it "エラーハンドリングができていること" do
        expect(@item).to be_valid
      end

      it "入力された販売価格によって、販売手数料や販売利益の表示が変わること" do
        expect(@item).to be_valid
      end

      it "入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること" do
        expect(@item).to be_valid
      end


    end


    context '商品出品機能がうまくいかないとき' do
      it "nameが無い時" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "explanationの情報が無い時" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      
      it "category_idが空欄の時" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが1の時" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "status_idの情報が無い時" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      
      it "status_idが1の時" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "delivery_fee_idの情報が無い時" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it "delivery_fee_idが１の時" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      
      it "shipper_idの情報が無い時" do
        @item.shipper_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipper can't be blank")
      end

      it "shipper_idが1の時" do
        @item.shipper_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipper must be other than 1")
      end

      it "delivery_day_idの情報が無い時" do
        @item.delivery_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      
      it "delivery_day_idが1の時" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end

      it "priceの情報が無い時" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it "priceが300以下の時" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it "priceが9999999以上の時" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      

    end
  end
end
