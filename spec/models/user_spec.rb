require 'rails_helper'

RSpec.describe User, type: :model do
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

  it 'can be assigned a therapist role' do
    user = User.new(email: 'therapist@example.com', password: 'password', role: :therapist)
    expect(user.role).to eq('therapist')
  end

  it 'can be assigned an admin role' do
    user = User.new(email: 'admin@example.com', password: 'password', role: :admin)
    expect(user.role).to eq('admin')
  end

  it 'is not valid without a role' do
    user = User.new(email: 'test@example.com', password: 'password')
    user.role = nil
    expect(user).to_not be_valid
  end

  it 'has a default role of client' do
    user = User.new(email: 'test@example.com', password: 'password')
    expect(user.role).to eq('client')
  end

  it 'has the correct available roles' do
    expect(User.roles.keys).to match_array(%w[client therapist admin])
  end

  it 'is not valid with a duplicate email' do
    User.create(email: 'test@example.com', password: 'password', role: :client)
    user = User.new(email: 'test@example.com', password: 'password', role: :client)
    expect(user).to_not be_valid
  end

  it 'is not valid with an invalid email format' do
    user = User.new(email: 'invalid_email', password: 'password', role: :client)
    expect(user).to_not be_valid
  end

  it 'is not valid with a password shorter than 6 characters' do
    user = User.new(email: 'test@example.com', password: 'short', role: :client)
    expect(user).to_not be_valid
  end

  describe 'associations' do
    # it { should have_many(:appointments) }
    # it { should have_many(:therapist_specializations).with_foreign_key('therapist_id') }
    # it { should have_many(:specializations).through(:therapist_specializations) }
  end

  describe 'roles' do
    # it { should define_enum_for(:role).with_values(%i[client therapist admin]) }
  end
end
