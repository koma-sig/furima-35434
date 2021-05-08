require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,pasword_confirmation,first_name,second_name,first_name_kana,second_name_kana,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationに半角数字が混合で入っていれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'emailに@が含まれている' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致している' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'first_nameとsecond_nameが（漢字・ひらがな・カタカナ）で入力されている' do
        @user.first_name = 'ああアア嗚呼'
        @user.second_name = 'ああアア嗚呼'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとsecond_name_kanaが全角（カタカナ）で入力されている' do
        @user.first_name_kana = 'アアアア'
        @user.second_name_kana = 'アアアア'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'second_nameが空では登録できない' do
        @user.second_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'second_name_kanaが空では登録できない' do
        @user.second_name_kana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordとpassword_confirmationが6文字以下で記入されている' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationに半角数字が混合されていない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password no half width digit")
      end
      it 'emailに@が含まれていない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'emailが一意性でない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordとpassword_confirmationが一致していない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationは数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password no half width digit")
      end
      it 'passwordとpassword_confirmationは英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password no half width digit")
      end
      it 'passwordとpassword_confirmationは全角では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password no half width digit")
      end
      it 'first_nameが（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.first_name = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'second_nameが（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.second_name = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name is invalid")
      end
      it 'first_name_kanaが全角（カタカナ）で入力されていない' do
        @user.first_name_kana = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'second_name_kanaが全角（カタカナ）で入力されていない' do
        @user.second_name_kana = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Second name kana is invalid")
      end
    end
  end
end
