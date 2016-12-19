# spec/models/user.rb
require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'is invalid without a username' do
    expect(FactoryGirl.build(:user, username: nil)).to_not be_valid
  end
  it 'is invalid without an email' do
    expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
  end
  it 'cannot use the same username as another user' do
    FactoryGirl.create(:user, username: 'dog')
    expect(FactoryGirl.build(:user, username: 'dog')).to_not be_valid
  end
  it 'cannot use the same email as another user' do
    FactoryGirl.create(:user, email: 'a@a.com')
    expect(FactoryGirl.build(:user, email: 'a@a.com')).to_not be_valid
  end
  it 'must have a valid email' do
    expect(FactoryGirl.build(:user, email: 'dog')).to_not be_valid
  end
end