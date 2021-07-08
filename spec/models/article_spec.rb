require 'rails_helper'

RSpec.describe Article, type: :model do

  it 'has valid factory' do
    expect(build(:article)).to be_valid
  end

  context 'has valid attributes' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(10) }
  end

  context 'has valid associations' do
    it {  should belong_to(:user).class_name('User') }
    it {  should have_many(:comments).class_name('Comment') }
  end

end
