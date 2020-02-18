require "rails_helper"

describe User, type: :model do

  context "presence true on step2" do

  let(:user_nickname_blank) { build(:user, nickname: nil) }
  let(:user_email_blank) { build(:user, email: nil) }
  let(:user_password_blank) { build(:user, password_digest: nil) }

    it "is invalid without nickname on step2" do
      user_nickname_blank.valid?(:step2)
      expect(user_nickname_blank.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without email on step2" do
      user_email_blank.valid?(:step2)
      expect(user_email_blank.errors[:email]).to include("を入力してください")
    end

    it "is invalid without password on step2" do
      user_password_blank.valid?(:step2)
      expect(user_password_blank.errors[:password_digest]).to include("を入力してください")
    end
  end

  context "format validation on step2" do
    format = ["hoge@gmail,com", "hoge@hoge", "hoge@gmail_com", "hoge@", "hoge.com", ":/rie.gmail.ip"]

    it "is invalid with if email's format is wrong" do
      format.each do |email|
        format_email_validation = build(:user, email: email)
        format_email_validation.valid?(:step2)
        expect(format_email_validation.errors[:email]).to include("は不正な値です")
      end
    end

    it "is invalid with that password is within 5 characters" do
      password_characters_validation = build(:user, password_digest: 1111)
      password_characters_validation.valid?(:step2)
      expect(password_characters_validation.errors[:password_digest]).to include("は7文字以上で入力してください")
    end

    it "is invalid with password's format is wrong" do
      password_characters_validation = build(:user, password_digest: 1111)
      password_characters_validation.valid?(:step2)
      expect(password_characters_validation.errors[:password_digest]).to include("は7文字以上で入力してください")
    end
  end
end
