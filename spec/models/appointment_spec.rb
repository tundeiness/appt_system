require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    let(:therapist) { FactoryBot.create(:user, :therapist) }
    let(:client) { FactoryBot.create(:user, :client) }
    let(:admin) { FactoryBot.create(:user, :admin) }

    it 'is valid with a therapist, client, start_time, and end_time' do
      appointment = Appointment.new(
        therapist:,
        client:,
        start_time: DateTime.now,
        end_time: DateTime.now + 1.hour
      )
      expect(appointment).to be_valid
    end

    it 'is not valid without a start_time' do
      appointment = Appointment.new(
        therapist:,
        client:,
        start_time: nil,
        end_time: DateTime.now + 1.hour
      )
      appointment.valid?
      expect(appointment.errors[:start_time]).to include("can't be blank")
    end

    it 'is not valid without an end_time' do
      appointment = Appointment.new(
        therapist:,
        client:,
        start_time: DateTime.now,
        end_time: nil
      )
      appointment.valid?
      expect(appointment.errors[:end_time]).to include("can't be blank")
    end

    it 'is not valid if end_time is before start_time' do
      appointment = Appointment.new(
        therapist:,
        client:,
        start_time: DateTime.now,
        end_time: DateTime.now - 1.hour
      )
      appointment.valid?
      expect(appointment.errors[:end_time]).to include('must be after start time')
    end

    it 'is not valid if therapist is not a therapist or admin' do
      non_therapist = FactoryBot.create(:user, :client)
      appointment = Appointment.new(
        therapist: non_therapist,
        client:,
        start_time: DateTime.now,
        end_time: DateTime.now + 1.hour
      )
      appointment.valid?
      expect(appointment.errors[:therapist]).to include('must have therapist or admin role')
    end

    it 'is valid if therapist is an admin' do
      appointment = Appointment.new(
        therapist: admin,
        client:,
        start_time: DateTime.now,
        end_time: DateTime.now + 1.hour
      )
      expect(appointment).to be_valid
    end

    it 'is not valid if client is not a client' do
      non_client = FactoryBot.create(:user, :therapist)
      appointment = Appointment.new(
        therapist:,
        client: non_client,
        start_time: DateTime.now,
        end_time: DateTime.now + 1.hour
      )
      appointment.valid?
      expect(appointment.errors[:client]).to include('must have client role')
    end
  end

  describe 'scopes' do
    let(:therapist) { FactoryBot.create(:user, role: :therapist, specialization: 'Cognitive Behavioral Therapy') }
    let(:client) { FactoryBot.create(:user, :client) }

    before do
      @available_appointment = FactoryBot.create(:appointment, :available, therapist: therapist)
      @booked_appointment = FactoryBot.create(:appointment, :booked, therapist:, client:)
    end

    it 'returns available appointments' do
      expect(Appointment.available).to include(@available_appointment)
      expect(Appointment.available).not_to include(@booked_appointment)
    end

    it 'returns booked appointments' do
      expect(Appointment.booked).to include(@booked_appointment)
      expect(Appointment.booked).not_to include(@available_appointment)
    end
  end
end
