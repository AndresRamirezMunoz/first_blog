require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:user) { User.first }
  let(:article) { FactoryBot.create(:article, user: user) }
  let(:article_params) { {title: "Articulo 2",  body: "Add some information about the album below", status: "public"} }


  before(:each) do
    sign_in(user)
  end

  it '#index' do
    get :index
    expect(response).to be_successful
  end

  it '#show' do
    get :show, params: { id: article.id }
    expect(response).to be_successful
  end

  it '#show_user_articles' do
    get :show_user_articles, params: { id: user.id }
    expect(response).to be_successful
  end

  it "#created article" do
    post :create, params: {article: article_params}
    expect(response).to redirect_to(Article.last)
    expect(Article.last.title).to eq("Articulo 2")
  end

  it '#edit' do
    get :edit, params: { id: article.id }
    expect(response).to be_successful
  end

  it '#update' do
    patch :update, params: { id: article.id, article: {title: "Articulo 3"}}
    expect(response).to redirect_to(Article.last)
    expect(Article.last.title).to eq("Articulo 3")
  end

  it '#destroy' do
    delete :destroy, params: { id: article.id }
    expect(response).to redirect_to(root_path)
    expect(Article.all.count).to eq(0)
  end

end
