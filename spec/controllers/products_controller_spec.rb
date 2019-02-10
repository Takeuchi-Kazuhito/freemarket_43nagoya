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
end
