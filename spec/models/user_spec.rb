require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,pasword_confirmation,first_name,second_name,first_name_kana,second_name_kana,birthdayが存在すれば登録できる' do
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      end
      it 'passwordとpassword_confirmationに半角数字が混合で入っていれば登録できる' do
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
    end
  end
end
