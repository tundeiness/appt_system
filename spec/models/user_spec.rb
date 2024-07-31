require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'is valid with valid attributes' do
    user = User.new(email: 'test@example.com', password: 'password', role: :client)
    expect(user).to be_valid
  end
end
