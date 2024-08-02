require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with with valid attributes' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without a first_name' do
      user = FactoryBot.build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it 'is not valid without a last_name' do
      user = FactoryBot.build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it 'is invalid without a phone_number' do
      user = FactoryBot.build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end

    it 'is invalid without an email' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid without a password' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'has a default role of client' do
      user = FactoryBot.create(:user)
      expect(user.role).to eq('client')
    end

    it 'can be assigned a therapist role' do
      user = FactoryBot.create(:user, role: :therapist)
      expect(user.role).to eq('therapist')
    end

    it 'is not valid without a role' do
      user = FactoryBot.build(:user, role: nil)
      user.valid?
      expect(user.errors[:role]).to include("can't be blank")
    end

    it 'has the correct available roles' do
      expect(User.roles.keys).to contain_exactly('client', 'therapist', 'admin')
    end

    it 'matches array of roles ' do
      expect(User.roles.keys).to match_array(%w[client therapist admin])
    end

    it 'is not valid with a duplicate email' do
      FactoryBot.create(:user, email: 'test@example.com')
      user = FactoryBot.build(:user, email: 'test@example.com')
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'is not valid with an invalid email format' do
      user = FactoryBot.build(:user, email: 'invalidemail')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'is not valid with a password shorter than 6 characters' do
      user = FactoryBot.build(:user, password: 'short', password_confirmation: 'short')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
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
