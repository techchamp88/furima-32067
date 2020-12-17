require 'rails_helper'
RSpec.describe Pay, type: :model do
  let(:pay) { FactoryBot.create(:pay) }
  before do
    @user1 = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @user1.id)
    @user2 = FactoryBot.create(:user, email: "test123@example")
    @pay = FactoryBot.build(:pay, user_id: @user2.id, item_id: @item.id)
  end

  describe '購入情報の保存' do
    context '商品購入機能がうまくいくとき' do
      it "全ての情報が記入されていること" do
        expect(@pay).to be_valid
      end
      it "buildingがなくても登録できる" do
      @pay.building = ""
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
      it "user_idの情報がない時" do
        @pay.user_id = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("User can't be blank")
      end
      it "item_idの情報がない時" do
        @pay.item_id = nil
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Item can't be blank")
      end


      it "shipper_idが1の時" do
        @pay.shipper_id = 1
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Shipper must be other than 1")
      end
      it "post_codeにハイフンがない時" do
        @pay.post_code = "1111111"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post code is invalid")
      end
      it "post_codeに半角数字以外が入っている時" do
        @pay.post_code = "aaa-aaaa"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Post code is invalid")
      end
      it "tel_numにハイフンが入っている時" do
        @pay.tel_num = "111-1111-1111"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel num is invalid")
      end
      it "tel_numに半角数字以外が入っている時" do
        @pay.tel_num = "aaaaaaaaaaa"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel num is invalid")
      end
      it "tel_numが１１文字以上のとき" do
        @pay.tel_num = "1111111111111"
        @pay.valid?
        expect(@pay.errors.full_messages).to include("Tel num is invalid")
      end

    end
  end
end
