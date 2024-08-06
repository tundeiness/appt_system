require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'validations' do
    # before do
    #   let(:therapist) { FactoryBot.create(:user, :therapist) }
    #   let(:client) { FactoryBot.create(:user, :client) }
    #   let(:admin) { FactoryBot.create(:user, :admin) }
    # end

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
  end
end
