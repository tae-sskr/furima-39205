# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires a nickname' do
      user = build(:user, nickname: nil)
      expect(user).not_to be_valid
    end

    it 'requires an email address' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'requires a unique email address' do
      existing_user = create(:user, email: 'test@example.com')
      new_user = build(:user, email: 'test@example.com')
      expect(new_user).not_to be_valid
    end

    it 'requires an email address to contain @' do
      user = build(:user, email: 'invalid_email')
      expect(user).not_to be_valid
    end

    it 'requires a password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end

    it 'requires a password with at least 6 characters' do
      user = build(:user, password: 'short')
      expect(user).not_to be_valid
    end

    it 'requires a password with a combination of letters and numbers' do
      user = build(:user, password: 'lettersonly')
      expect(user).not_to be_valid
    end

    it 'requires password and password confirmation to match' do
      user = build(:user, password: 'password', password_confirmation: 'different_password')
      expect(user).not_to be_valid
    end

    it 'requires a first name' do
      user = build(:user, family_name: nil, first_name: 'First')
      expect(user).not_to be_valid
    end

    it 'requires a last name' do
      user = build(:user, family_name: 'Last', first_name: nil)
      expect(user).not_to be_valid
    end

    it 'requires full-width characters for the name' do
      user = build(:user, family_name: '半角', first_name: '名前')
      expect(user).not_to be_valid
    end

    it 'requires full-width katakana characters for the kana name' do
      user = build(:user, family_name_kana: 'カナ', first_name_kana: '半角')
      expect(user).not_to be_valid
    end

    it 'requires a birth date' do
      user = build(:user, birth_day: nil)
      expect(user).not_to be_valid
    end
  end
end
