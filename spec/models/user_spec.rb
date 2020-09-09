require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ""
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "emailが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.email = ""
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "birthdayが空だと登録できない" do
      user = FactoryBot.build(:user)
      user.birthday = ""
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end


