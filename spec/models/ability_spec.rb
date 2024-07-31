# require 'rails_helper'
# require 'cancan/matchers'

# RSpec.describe Ability, type: :model do
#   describe 'User abilities' do
#     subject(:ability) { Ability.new(user) }
#     let(:user) { nil }

#     context 'when is an admin' do
#       let(:user) { User.create(email: 'admin@example.com', password: 'password', role: :admin) }

#       it { is_expected.to be_able_to(:manage, :all) }
#     end

#     context 'when is a therapist' do
#       # let(:user) { User.create(email: 'therapist@example.com', password: 'password', role: :therapist) }
#       let(:client) { User.create(email: 'client@example.com', password: 'password', role: :client) }

#       it { is_expected.to be_able_to(:read, client) }
#       # it { is_expected.to be_able_to(:update, user) }
#       it { is_expected.not_to be_able_to(:update, client) }
#     end

#     context 'when is a client' do
#       let(:user) { User.create(email: 'client@example.com', password: 'password', role: :client) }
#       let(:therapist) { User.create(email: 'therapist@example.com', password: 'password', role: :therapist) }

#       it { is_expected.to be_able_to(:read, therapist) }
#     end
#   end
# end
