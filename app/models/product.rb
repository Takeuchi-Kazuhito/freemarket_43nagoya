class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :status, :shipping_method, :shipping_timetable, :region, :image, presence: true
  validates :name, presence: true, length: { in: 1..40 }
  validates :description, presence: true, length: { in: 1..1000 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  belongs_to :seller, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true

  def prev_id
    Product.where("id < ?", self.id).order("id DESC").first
  end

  def next_id
    Product.where("id > ?", self.id).order("id ASC").first
  end

  enum status: [
    "新品、未使用",
    "未使用に近い",
    "目立った傷や汚れなし",
    "やや傷や汚れあり",
    "傷や汚れあり",
    "全体的に状態が悪い"]

  enum shipping_burden: [
    "送料込み(出品者負担)",
    "着払い(購入者負担)"]

  enum shipping_method: [
    "未定",
    "らくらくメルカリ便",
    "ゆうメール",
    "レターパック",
    "普通郵便(定形、定形外)",
    "クロネコヤマト",
    "ゆうパック",
    "クリックポスト",
    "ゆうパケット"]

  enum shipping_timetable: [
    "1~2日で発送",
    "2~3日で発送",
    "4~7日で発送"]
end
