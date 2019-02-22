require 'rails_helper'

describe User do
  describe 'registration_step_1' do #ステップ1のバリデーションテスト
    it "is invalid without a nickname" do
      user =  build(:user, nickname: "")
      user.valid?(:registration_step_1)
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user =  build(:user, email: "")
      user.valid?(:registration_step_1)
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user =  build(:user, password: "")
      user.valid?(:registration_step_1)
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "0101")
      user.valid?(:registration_step_1)
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?(:registration_step_1)
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is invalid with a nickname that has more than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?(:registration_step_1)
      expect(user.errors[:nickname][0]).to include("は20文字以内で入力してください")
    end

    it "is invalid with a password that has less than 5 characters " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("は6文字以上で入力してください")
    end
  end

  describe 'registration_step_2' do #ステップ2のバリデーションテスト
    it "is invalid without a phone_number" do
      user =  build(:user, phone_number: "")
      user.valid?(:registration_step_2)
      expect(user.errors[:phone_number]).to include("を入力してください")
    end
  end

  describe 'registration_step_3' do #ステップ3のバリデーションテスト
    it "is invalid without a family_name" do
      user =  build(:user, family_name: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
      user =  build(:user, first_name: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a family_katakana" do
      user =  build(:user, family_katakana: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:family_katakana]).to include("を入力してください")
    end

    it "family_katakana use hiragana" do
      user =  build(:user, family_katakana: "あいうえお")
      user.valid?(:registration_step_3)
      expect(user.errors[:family_katakana]).to include("は不正な値です")
    end

    it "family_katakana use integer" do
      user =  build(:user, family_katakana: "12345")
      user.valid?(:registration_step_3)
      expect(user.errors[:family_katakana]).to include("は不正な値です")
    end

    it "family_katakana use alphabet" do
      user =  build(:user, family_katakana: "abcdefg")
      user.valid?(:registration_step_3)
      expect(user.errors[:family_katakana]).to include("は不正な値です")
    end

    it "family_katakana regexp sucsess pattern" do
      user = build(:user, family_katakana: "カタカナ")
      expect(user[:family_katakana]).to match(/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/)
    end

    it "is invalid without a first_katakana" do
      user =  build(:user, first_katakana: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:first_katakana]).to include("を入力してください")
    end

    it "first_katakana use hiragana" do
      user =  build(:user, first_katakana: "あいうえお")
      user.valid?(:registration_step_3)
      expect(user.errors[:first_katakana]).to include("は不正な値です")
    end

    it "first_katakana use integer" do
      user =  build(:user, first_katakana: "12345")
      user.valid?(:registration_step_3)
      expect(user.errors[:first_katakana]).to include("は不正な値です")
    end

    it "first_katakana use alphabet" do
      user =  build(:user, first_katakana: "abcdefg")
      user.valid?(:registration_step_3)
      expect(user.errors[:first_katakana]).to include("は不正な値です")
    end

    it "first_katakana regexp sucsess pattern" do
      user = build(:user, first_katakana: "カタカナ")
      expect(user[:first_katakana]).to match(/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/)
    end

    it "is invalid without a domicile_pref" do
      user =  build(:user, domicile_pref: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:domicile_pref]).to include("を入力してください")
    end

    it "is invalid without a domicile_city" do
      user =  build(:user, domicile_city: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:domicile_city]).to include("を入力してください")
    end

    it "is invalid without a domicile_add" do
      user =  build(:user, domicile_add: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:domicile_add]).to include("を入力してください")
    end

    it "is invalid without a postal_code" do
      user =  build(:user, postal_code: "")
      user.valid?(:registration_step_3)
      expect(user.errors[:postal_code]).to include("を入力してください")
    end

    it "postal_code use alphabet" do
      user = build(:user, postal_code: "aaa-aaaa")
      user.valid?(:registration_step_3)
      expect(user.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_code no hyphen" do
      user = build(:user, postal_code: "1234567")
      user.valid?(:registration_step_3)
      expect(user.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_code use string" do
      user = build(:user, postal_code: "ああああ-あああ")
      user.valid?(:registration_step_3)
      expect(user.errors[:postal_code]).to include("は不正な値です")
    end

    it "postal_code regexp sucsess pattern" do
      user = build(:user, postal_code: "123-4567")
      expect(user[:postal_code]).to match(/\A[0-9]{3}-[0-9]{4}\z/)
    end
  end

  describe 'registration_all_step' do #全体のバリデーションテスト
    it "is valid with a all column" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end
