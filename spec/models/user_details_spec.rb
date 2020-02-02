require "rails_helper"

describe UserDetail, type: :model do

  context "presence true on step2" do

    let(:first_name_blank) { build(:user_detail, first_name: nil) }
    let(:first_name_kana_blank) { build(:user_detail, first_name_kana: nil) }
    let(:last_name_blank) { build(:user_detail, last_name: nil) }
    let(:last_name_kana_blank) { build(:user_detail, last_name_kana: nil) }
    let(:birth_year_blank) { build(:user_detail, birth_year: nil) }
    let(:birth_month_blank) { build(:user_detail, birth_month: nil) }
    let(:birth_day_blank) { build(:user_detail, birth_day: nil) }

    it "is invalid without first_name" do
      first_name_blank.valid?(:step2)
      expect(first_name_blank.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without first_name_kana" do
      first_name_kana_blank.valid?(:step2)
      expect(first_name_kana_blank.errors[:first_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "is invalid without last_name" do
      last_name_blank.valid?(:step2)
      expect(last_name_blank.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without last_name_kana" do
      last_name_kana_blank.valid?(:step2)
      expect(last_name_kana_blank.errors[:last_name_kana]).to include("全角カタカナのみで入力して下さい")
    end

    it "is invalid without birth_year" do
      birth_year_blank.valid?(:step2)
      expect(birth_year_blank.errors[:birth_year]).to include("を入力してください")
    end

    it "is invalid without birth_month" do
      birth_month_blank.valid?(:step2)
      expect(birth_month_blank.errors[:birth_month]).to include("を入力してください")
    end

    it "is invalid without birth_day" do
      birth_day_blank.valid?(:step2)
      expect(birth_day_blank.errors[:birth_day]).to include("を入力してください")
    end
  end

  context "presence true on new" do

    let(:phone_number_blank) { build(:user_detail, phone_number: nil) }

    it "is invalid without phone_number" do
      phone_number_blank.valid?(:new)
      expect(phone_number_blank.errors[:phone_number]).to include("を入力してください")
    end
  end

  context "presence true on create" do

    let(:postal_code_blank) { build(:user_detail, postal_code: nil) }
    let(:prefecture_id_blank) { build(:user_detail, prefecture_id: nil) }
    let(:city_blank) { build(:user_detail, city: nil) }
    let(:address_blank) { build(:user_detail, address: nil) }

    it "is invalid without postal_code" do
      postal_code_blank.valid?(:create)
      expect(postal_code_blank.errors[:postal_code]).to include("を入力してください")
    end

    it "is invalid without prefecture_id" do
      prefecture_id_blank.valid?(:create)
      expect(prefecture_id_blank.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without city" do
      city_blank.valid?(:create)
      expect(city_blank.errors[:city]).to include("を入力してください")
    end

    it "is invalid without address" do
      address_blank.valid?(:create)
      expect(address_blank.errors[:address]).to include("を入力してください")
    end
  end
end
