require 'rails_helper'

RSpec.describe Pair, type: :model do
  describe 'validations' do
    let(:client) { FactoryBot.create(:user, role: :client) }
    let(:therapist) { FactoryBot.create(:user, role: :therapist, specialization: 'Cognitive Behavioral Therapy') }

    it 'is valid with valid attributes' do
      pair = FactoryBot.build(:pair, client:, therapist:)
      expect(pair).to be_valid
    end

    it 'is invalid without a client' do
      pair = FactoryBot.build(:pair, client: nil, therapist:)
      expect(pair).to_not be_valid
    end

    it 'is invalid without a therapist' do
      pair = FactoryBot.build(:pair, client: client, therapist: nil)
      expect(pair).to_not be_valid
    end
  end
end
