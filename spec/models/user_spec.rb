require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー作成' do

      context '内容に問題がある場合' do
        it "nikcnameがない場合は登録できないこと" do
          @user.nickname = nil
          @user.valid?
          expect(@user.errors[:nickname]).to include("can't be blank")
        end
    
        it "emailがない場合は登録できないこと" do
          @user.email = nil
          @user.valid?
          expect(@user.errors[:email]).to include("can't be blank")
        end

        it "emailは＠を含まないと登録できないこと" do
          @user.email = "abcdemail"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "重複したemailが存在する場合登録できないこと" do
          @user = FactoryBot.create(:user)                                          
          @another_user = FactoryBot.build(:user, email: @user.email)             
          @another_user.valid?                                                     
          expect(@another_user.errors[:email]).to include("has already been taken") 
        end
        
        it "passwordがない場合は登録できないこと" do
          @user.password = nil
          @user.valid?
          expect(@user.errors[:password]).to include("can't be blank")
        end

        it "passwordが5文字以下であれば登録できないこと" do
          @password = 'a1'+ Faker::Internet.password(min_length: 3, max_length: 3)
          @user = FactoryBot.build(:user, password: @password, password_confirmation: @password)
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation is too short (minimum is 6 characters)")
        end

        it "passwordが数字のみの場合は登録できないこと" do
          @user.password = "1234567"
          @user.password_confirmation = "1234567"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end
    
        it "passwordが英文字のみの場合は登録できないこと" do
          @user.password = "abcdefg"
          @user.password_confirmation = "abcdefg"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end
    
        it "password_confirmationがない場合は登録できないこと" do
          @user.password_confirmation = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
        end
    
        it "passwordとpassword_confirmationが一致していない場合は登録できないこと" do
          @user.password = "abcd123"
          @user.password_confirmation = "123abcd"
          @user.valid?
          expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
        end

        it "passwordは全角英数字混合では登録できないこと" do
          @user.password = "あああ１１１"
          @user.password_confirmation = "あああ１１１"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end
          
        it "first_nameが全角文字でなければ登録できないこと" do
          @user.first_name = "ｾﾞﾝｶｸﾃﾞﾊﾅｲ"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end

        it "family_nameが全角文字でなければ登録できないこと" do
          @user.family_name = "not zenkaku"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
        end
        
        it "first_name_kanaが全角カナ文字でなければ登録できないこと" do
          @user.first_name_kana = "カナ文字ではない"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください")
        end

        it "family_name_kanaが全角カナ文字でなければ登録できないこと" do
          @user.family_name_kana = "ｾﾞﾝｶｸﾃﾞﾊﾅｲ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana 全角カナ文字を使用してください")
        end

        it "first_nameがない場合は登録できないこと" do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors[:first_name]).to include("can't be blank")
        end
        
        it "family_nameがない場合は登録できないこと" do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors[:family_name]).to include("can't be blank")
        end
        
        it "first_name_kanaがない場合は登録できないこと" do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include("can't be blank")
        end 
  
        it "family_name_kanaがない場合は登録できないこと" do
          @user.family_name_kana = nil
          @user.valid?
          expect(@user.errors[:family_name_kana]).to include("can't be blank")
        end
        
        it "birth_dateがない場合は登録できないこと" do
          @user.birth_date = nil
          @user.valid?
          expect(@user.errors[:birth_date]).to include("can't be blank")
        end
      end
      

      context '内容に問題ない場合' do

        it "全ての項目の入力が存在すれば登録できること" do
          @user = FactoryBot.build(:user)
          expect(@user).to be_valid
        end

        it "passwordが6文字以上であれば登録できること" do
          @password = 'a1'+ Faker::Internet.password(min_length: 6, max_length: 6)
          @user = FactoryBot.build(:user, password: @password, password_confirmation: @password)
          @user.valid?
          expect(@user).to be_valid
        end

        it "passwordが6文字以上で、英数字の組み合わせであれば登録できること" do
          @user.password = "abc123"
          @user.password_confirmation = "abc123"
          @user.valid?
          expect(@user).to be_valid
        end

        it "first_nameが全角文字であれば登録できること" do
          @user.first_name = "ぜんかく"
          @user.valid?
          expect(@user).to be_valid
        end
        it "family_nameが全角文字であれば登録できること" do
          @user.family_name = "ぜんかく"
          @user.valid?
          expect(@user).to be_valid
        end

        it "first_name_kanaが全角カナ文字であれば登録できること" do
          @user.first_name_kana = "ゼンカクカナ"
          @user.valid?
          expect(@user).to be_valid
        end
        it "family_name_kanaが全角カナ文字であれば登録できること" do
          @user.family_name_kana = "ゼンカクカナ"
          @user.valid?
          expect(@user).to be_valid
        end

      end
      
    end
  end
end

