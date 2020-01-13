class UserDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  VALID_KATAKANA_REGEX = /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
  VALID_ZENKAKU_REGEX = /\A[一-龥ぁ-ん]/
  VALID_PHONENUMBER_REGEX = /\A\d{10,11}\z/
  VALID_POSTALCODE_REGEX = /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$|^\d{5}$|^\d{7}\z/

  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture
  validates :first_name, :last_name, presence: true, format: { with: VALID_ZENKAKU_REGEX }, on: :step2
  validates :first_name_kana, :last_name_kana, format: {
                   with: VALID_KATAKANA_REGEX,
                   message: "全角カタカナのみで入力して下さい"
                 }, on: :step2
  validates :birth_year, :birth_month, :birth_day, presence: true, on: :create
  validates :phone_number, presence: true, format: { with: VALID_PHONENUMBER_REGEX }, on: :new
  validates :postal_code, presence: true, format: { with: VALID_POSTALCODE_REGEX }, on: :create
end
