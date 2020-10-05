require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナを入力してください")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
    
    
    context '追加、新規登録がうまくいかないとき' do
      it "メールアドレスは一意性である" do
        new_user = FactoryBot.create(:user, email:'test@test.com')
        another_user = FactoryBot.build(:user, email:'test@test.com')
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "メールアドレスは@を含む必要がある" do
        @user.email = "@+"
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it "パスワードは6文字以上である" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      it "パスワードは半角英数字混合である" do
        @user.password = "/\A[a-zA-Z0-9]+\z/"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "パスワードは確認用を含めて2回入力する" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）で入力させる" do
        @user.first_name = "/\A[ぁ-んァ-ン一-龥]/"
        @user.last_name = "/\A[ぁ-んァ-ン一-龥]/"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字を入力してください")
      end
      it "ユーザー本名のフリガナは、全角（カタカナ）で入力させる" do
        @user.first_name_kana = "/\A[ァ-ヶー－]+\z/"
        @user.last_name_kana = "/\A[ァ-ヶー－]+\z/"
        @user.valid?
        expect(@user.errors.full_messages).to include("名字カナを入力してください")
      end
    end
  end
end


