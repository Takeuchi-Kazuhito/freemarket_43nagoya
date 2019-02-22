require 'rails_helper'
describe Product do
  describe '#create' do
    it "画像が無いと無効" do
      product = build(:product, image: "")
      product.valid?
      expect(product.errors[:image]).to include("選択してください")
    end

    it "商品の状態が無いと無効" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("選択してください")
    end

    it "配送料の負担が無いと無効" do
      product = build(:product, shipping_burden: "")
      product.valid?
      expect(product.errors[:shipping_burden]).to include("選択してください")
    end

    it "配送方法が無いと無効" do
      product = build(:product, shipping_method: "")
      product.valid?
      expect(product.errors[:shipping_method]).to include("選択してください")
    end

    it "発送までの日数が無いと無効" do
      product = build(:product, shipping_timetable: "")
      product.valid?
      expect(product.errors[:shipping_timetable]).to include("選択してください")
    end

    it "発送元の地域が無いと無効" do
      product = build(:product, region: "")
      product.valid?
      expect(product.errors[:region]).to include("選択してください")
    end

    it "商品名が無いと無効" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("入力してください")
    end

    it "商品の説明が無いと無効" do
      product = build(:product, description: "")
      product.valid?
      expect(product.errors[:description]).to include("入力してください")
    end

    it "商品名が40文字より多いと無効" do
      product = build(:product, name: "a"*41)
      product.valid?
      expect(product.errors[:name]).to include("40 文字以下で入力してください")
    end

    it "商品の説明が1000文字より多いと無効" do
      product = build(:product, description: "a"*1001)
      product.valid?
      expect(product.errors[:description]).to include("1000 文字以下で入力してください")
    end

    it "販売価格が300以下で無効" do
      product = build(:product, price: "299")
      product.valid?
      expect(product.errors[:price]).to include("300以上9999999以下で入力してください")
    end

    it "販売価格が9999999以上で無効" do
      product = build(:product, price: "10000000")
      product.valid?
      expect(product.errors[:price]).to include("300以上9999999以下で入力してください")
    end
  end
end
