require "rails_helper"

describe User, type: :model do

  let(:user_nickname_blank) { build(:user, nickname: nil) }
  let(:user_email_blank) { build(:user, email: nil) }
  let(:user_password_blank) { build(:user, password_digest: nil) }

  context "presence true on step2" do
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
end
