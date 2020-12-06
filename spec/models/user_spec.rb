require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do

      it "nickname、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "メールアドレスに@が含まれていれば登録できる" do
        @user.email = "test@example.com"
        expect(@user).to be_valid
      end

      it "passwordが6文字以上かつ英数字であれば登録できる" do
        @user.password = "a00000"
        @user.password_confirmation = "a00000"
        expect(@user).to be_valid
      end

      it "パスワードと確認用パスワードが一致すること" do
        @user.password == @user.password_confirmation
        expect(@user).to be_valid
      end


      it "ユーザーの名前は全角であれば登録できる" do
      @user.first_name = "けん"
      expect(@user).to be_valid
      end

      it "ユーザーの苗字は全角であれば登録できる" do
      @user.last_name = "あべ"
      expect(@user).to be_valid
      end
    end













    context '新規登録がうまくいかないとき' do
      context "空で登録する場合" do
        it "nicknameが空では登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it "emailが空では登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "passwordが空では登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        
        it "last_nameが空では登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        
        it "first_nameが空では登録できない" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        
        it "last_name_kanaが空では登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        
        it "first_name_kanaが空では登録できない" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "birthdayが空では登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end 
      


      
      it "emailに@がないと登録できない" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      
      it "同じメールアドレスを登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end


      it "password_confirmationがpasswordと一致していなければ登録できない" do
        @user.password_confirmation = "000000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "passwordが英字のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it "passwordが数字のみだと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      
      it "passwordは全角で登録できない" do
        @user.password = "ａａａａａａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end




      it "last_nameが全角でないと登録できない" do
        @user.last_name = "ｱﾍﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it "first_nameが全角でないと登録できない" do
        @user.first_name = "ｹﾝ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it "last_name_kanaがカタカナでないと登録できない" do
        @user.last_name_kana = "あべ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      
      it "first_name_kanaがカタカナでないと登録できない" do
        @user.first_name_kana = "けん"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end