require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password', role: :client)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(password: 'password', role: :client)
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(email: 'test@example.com', role: :client)
    expect(user).to_not be_valid
  end

  it 'has a default role of client' do
    user = User.new
    expect(user.role).to eq('client')
  end
end
