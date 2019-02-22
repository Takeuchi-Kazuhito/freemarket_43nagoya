require 'rails_helper'

describe ProductsController do

  describe 'GET #index' do
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'products ordered by id DESC' do
      products = create_list(:product, 3)
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.id <=> a.id })
    end
  end

  describe 'GET #list' do
    it 'renders the :list template' do
      get :list
      expect(response).to render_template :list
    end

    it 'products ordered by id DESC' do
      products = create_list(:product, 3)
      get :list
      expect(assigns(:products)).to match(products.sort{ |a, b| b.id <=> a.id })
    end
  end

  describe 'GET #show' do
    it 'renders the :show template' do
      product = create(:product)
      get :show, params: { id: product.id }
      expect(response).to render_template :show
    end

    it 'products of same seller_id ordered by id DESC' do
      product = create(:product)
      products = create_list(:product, 3, seller_id: product.seller.id)
      get :show, params: { id: product.id }
      expect(assigns(:products)).to match(products.sort{ |a, b| b.id <=> a.id })
    end

    it 'products of same seller_id not include current product' do
      product = create(:product)
      get :show, params: { id: product.id }
      expect(assigns(:products)).not_to include product
    end
  end

  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
    end
  end

  describe 'POST #create' do
    context 'user loged-in and successfully saved' do
      before do
        login_user user
      end

      it 'saves the new product in the database' do
        expect{post :create, params}.to change(Product, :count).by(1)
      end

      it 'redirects to products#index' do
        post :create, params
        expect(response).to redirect_to products_path
      end
    end

    context 'user loged-in but missed saved' do
      before do
        login_user user
      end

      it 'unsave the new product in the database' do
        expect{
          post :create, params: { product: attributes_for(:product, image: nil) }
        }.to change(Product, :count).by(0)
      end

      it 'render new_product_path' do
        post :create, params
        expect(response).to redirect_to new_product_path
      end
    end
  end

  describe "#edit" do
    context "as an authorized user" do
      # 正常なレスポンスか？
      it "responds successfully" do
        sign_in @user
        get :edit, params: {id: @product.id}
        expect(response).to be_success
      end
      # 200レスポンスが返ってきているか？
      it "returns a 200 response" do
        sign_in @user
        get :edit, params: {id: @product.id}
        expect(response).to have_http_status "200"
      end
    end
    context "as an unauthorized user" do
      # 正常なレスポンスが返ってきていないか？
      it "does not respond successfully" do
        sign_in @another_user
        get :edit, params: {id: @product.id}
        expect(response).to_not be_success
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      # 正常に商品を更新できるか？
      it "updates an product" do
        sign_in @user
        product_params = build{:product}
        patch :update, params: {id: @product.id, product: product_params}
        expect(@product.reload.name).to eq :product
      end
      # 商品を更新した後、更新された商品の詳細ページへリダイレクトするか？
      it "redirects the page to /products/product.id(1)" do
        sign_in @user
        product_params = build{:product}
        patch :update, params: {id: @product.id, product: product_params}
        expect(response).to redirect_to "/products/1"
      end
    end
    context "with invalid attributes" do
      # 不正なアトリビュートを含む商品は更新できなくなっているか？
      it "does not update an product" do
        sign_in @user
        product_params = {name: ""}
        patch :update, params: {id: @product.id, product: product_params}
        expect(@product.reload.title).to eq :name
      end
      # 不正な商品を更新しようとすると、再度更新ページへリダイレクトされるか？
      it "redirects the page to /products/product.id(1)/edit" do
        sign_in @user
        product_params = {name: ""}
        patch :update, params: {id: @product.id, product: product_params}
        expect(response).to redirect_to "/products/1/edit"
      end
    end
  end
end
