require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,family_name,first_name,family_name_kana,first_name_kana,birthdayが入力されていれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で、半角英数混同であれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "ユーザー本名が全角であれば登録できる" do
        @user.family_name = "ああ"
        @user.first_name = "いい"
        expect(@user).to be_valid
      end
      it "ユーザー本名のフリガナが全角カタカナであれば登録できる" do
        @user.family_name_kana = "アア"
        @user.first_name_kana = "イイ"
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Emailはすでに存在します")
      end
      it "emailは@を含む必要がある" do
        @user.email = "test.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailは不正な値です")
      end
      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaa11"
        @user.password_confirmation = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは6文字以上で入力してください")
      end
      it "passwordは半角英数混合でなければならない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordは不正な値です")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.save
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it "ユーザー本名の名字が空では登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family nameを入力してください")
      end
      it "ユーザー本名の名前が空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameを入力してください")
      end
      it "ユーザー本名の名字が半角では登録できない" do
        @user.family_name = "aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family namePlease use full-wid")
      end
      it "ユーザー本名の名前が半角では登録できない" do
        @user.first_name = "ii"
        @user.valid?
        expect(@user.errors.full_messages).to include("First namePlease use full-wid")
      end
      it "ユーザー本名のフリガナの名字が空では登録できない" do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanaを入力してください")
      end
      it "ユーザー本名のフリガナの名前が空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaを入力してください")
      end
      it "ユーザー本名のフリガナの名字が半角では登録できない" do
        @user.family_name_kana = "uu"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanaPlease use full-wid")
      end
      it "ユーザー本名のフリガナの名前が半角では登録できない" do
        @user.first_name_kana = "ee"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaPlease use full-wid")
      end
      it "生年月日が空では登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
    end
  end
end