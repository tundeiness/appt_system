require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:therapist) { FactoryBot.create(:user, :therapist, specialization: 'Cognitive Behavioral Therapy') }
  let(:schedule) { FactoryBot.create(:schedule) }

  subject do
    described_class.new(
      therapist:,
      start_time: DateTime.now,
      end_time: DateTime.now + 1.hour
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a start_time' do
      subject.start_time = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:start_time]).to include("can't be blank")
    end

    it 'is not valid without an end_time' do
      subject.end_time = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:end_time]).to include("can't be blank")
    end

    it 'is not valid if end_time is before start_time' do
      subject.end_time = subject.start_time - 1.hour
      expect(subject).to_not be_valid
      expect(subject.errors[:end_time]).to include('must be after start time')
    end

    it 'is not valid without a therapist' do
      subject.therapist = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:therapist]).to include('must exist')
    end
  end

  describe 'custom validations' do
    it 'is not valid if therapist is not a therapist' do
      subject.therapist = FactoryBot.create(:user, :client)
      expect(subject).to_not be_valid
      expect(subject.errors[:therapist]).to include('must have therapist or admin role')
    end
  end
end
