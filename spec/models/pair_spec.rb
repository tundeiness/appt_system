require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe 'validations' do
    let(:client) { FactoryBot.create(:user, role: :client) }
    let(:therapist) { FactoryBot.create(:user, role: :therapist, specialization: 'Cognitive Behavioral Therapy') }

    it 'is valid with valid attributes' do
      pair = build(:pair, client:, therapist:)
      expect(pair).to be_valid
    end

    it 'is invalid without a client' do
      pair = build(:pair, client: nil, therapist:)
      expect(pair).to_not be_valid
    end

    it 'is invalid without a therapist' do
      pair = build(:pair, client:, therapist: nil)
      expect(pair).to_not be_valid
    end

    it 'is invalid if the pair already exists' do
      create(:pair, client:, therapist:)
      duplicate_pair = build(:pair, client:, therapist:)
      expect(duplicate_pair).to_not be_valid
    end
  end
end
