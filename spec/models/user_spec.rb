# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmation、first_name、family_name、first_name_kana、family_name_kana、birth_dayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英語のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end
      it 'passwordは全角文字があると登録できない' do
        @user.password = 'aaa 11１'
        @user.password_confirmation = 'aaa 11１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 英字と数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
     it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが半角だと登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが半角だと登録できない' do
        @user.first_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaはカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'たろう', '太朗', 'taro', '123', '&%'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'family_name_kanaはカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name = 'やまだ', '山田', 'yamada', '123', '&%'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end

