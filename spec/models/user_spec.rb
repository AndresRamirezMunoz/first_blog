require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(id: 1, email: 'prueba@gmail.com', password:'12345') }
  let(:article) {create(:article)}
  let(:comment) {create(:comment)}

  it 'has factory' do
    expect(create(:user)).to be_persisted
  end

  it 'user articles' do
    expect(user.articles.count).to eq(0)
    expect(user.articles).to eq([])

    article.user = user

    expect(user.articles.count).to eq(1)
    expect(user.articles.count).to eq(1)

  end

  it 'user comments' do
    expect(user.comments.count).to eq(0)
    expect(user.comments).to eq([])

    article.user = user
    comment.article = article

    expect(user.comments.count).to eq(1)
  end

  it 'user followers' do
    expect(user.followers.count).to eq(0)
    expect(user.followers).to eq([])
  end

  it 'user followings' do
    expect(user.followings.count).to eq(0)
    expect(user.followings).to eq([])
  end

  it 'confirms if respond to methods' do
    expect(subject).to respond_to(:articles)
    expect(subject).to respond_to(:comments)
    expect(subject).to respond_to(:followers)
    expect(subject).to respond_to(:followings)
    expect(subject).not_to respond_to(:show_user_articles)
  end

end
