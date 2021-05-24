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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)を入力してください")
      end
      it 'second_nameが空では登録できない' do
        @user.second_name =''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)は不正な値です")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)を入力してください")
      end
      it 'second_name_kanaが空では登録できない' do
        @user.second_name_kana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday =''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'passwordとpassword_confirmationが6文字以下で記入されている' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'emailに@が含まれていない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'emailが一意性でない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'passwordとpassword_confirmationが一致していない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationは数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で登録してください")
      end
      it 'passwordとpassword_confirmationは英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で登録してください")
      end
      it 'passwordとpassword_confirmationは全角では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは半角英数字で登録してください")
      end
      it 'first_nameが（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.first_name = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)は不正な値です")
      end
      it 'second_nameが（漢字・ひらがな・カタカナ）で入力されていない' do
        @user.second_name = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(全角)は不正な値です")
      end
      it 'first_name_kanaが全角（カタカナ）で入力されていない' do
        @user.first_name_kana = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end
      it 'second_name_kanaが全角（カタカナ）で入力されていない' do
        @user.second_name_kana = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end
      it 'first_name_kanaの全角文字がカタカナ意外だと登録されない' do
        @user.first_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end
      it 'second_name_kanaの全角文字がカタカナ意外だと登録されない' do
        @user.second_name_kana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end
    end
  end
end
