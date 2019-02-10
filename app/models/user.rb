class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :selling_products, -> { where('buyer_id is NULL') }, foreign_key: 'seller_id', class_name: 'Product'
  has_many :sold_products, -> { where('buyer_id is not NULL') }, foreign_key: 'buyer_id', class_name: 'Product'
  has_many :bought_products, foreign_key: 'buyer_id', class_name: 'Product'


  with_options presence: true do
    validates :family_name
    validates :first_name
    validates :family_katakana
    validates :first_katakana
    validates :domicile_pref
    validates :domicile_city
    validates :domicile_add
    validates :birthday_year
    validates :birthday_month
    validates :birthday_day
    validates :nickname
  end

  validates :family_katakana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }, allow_blank: true

  validates :first_katakana, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/ }, allow_blank: true

  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }, allow_blank: true


end
