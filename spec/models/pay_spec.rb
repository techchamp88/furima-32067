require 'rails_helper'
RSpec.describe Pay, type: :model do
  let(:pay) { FactoryBot.create(:pay) }
  before do
    @pay = FactoryBot.build(:pay)
  end

  describe '購入情報の保存' do
    context '商品購入機能がうまくいくとき' do
      it "post_code,shipper_id,city,address,tel_num,tokenが空でないこと" do
        expect(@pay).to be_valid
      end
      it "post_codeにはハイフンが必要で数字のみ記入してある(123-4567)" do
        @pay.post_code = "123-4567"
        expect(@pay).to be_valid
      end
      it "電話番号にはハイフンはなく数字のみであり11文字いないである(00000000000)" do
        @pay.tel_num = 11111111111
        expect(@pay).to be_valid
      end
    end

    context '商品購入機能がうまくいかない時' do
      it "post_codeの情報がない時" do
        @pay.post_code = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post code can't be blank")
      end
      it "shipper_idの情報がない時" do
        @pay.shipper_id = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Shipper can't be blank")
      end
      it "cityの情報がない時" do
        @pay.city = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("City can't be blank")
      end
      it "addressの情報がない時" do
        @pay.address = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Address can't be blank")
      end
      it "tel_numの情報がない時" do
        @pay.tel_num = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel num can't be blank")
      end
      it "tokenの情報がない時" do
        @pay.token = ""
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Token can't be blank")
      end

      it "shipper_idが1の時" do
        @pay.shipper_id = 1
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Shipper must be other than 1")
      end
      it "post_codeにハイフンがない時" do
        @pay.post_code = 1111111
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post code is invalid")
      end
      it "post_codeに半角数字以外が入っている時" do
        @pay.post_code = "aaa-aaaa"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post code is invalid")
      end
      it "tel_numにハイフンが入っている時" do
        @pay.tel_num = 111-1111-1111
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel num is invalid")
      end
      it "tel_numに半角数字以外が入っている時" do
        @pay.tel_num = "aaaaaaaaaaa"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel num is invalid")
      end
      it "tel_numが１１文字以上のとき" do
        @pay.tel_num = 1111111111111
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel num is invalid")
      end

    end
  end
end
