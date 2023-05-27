require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Josphat', email: 'josphat@example.com', password: '123456')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'josphat@example.com'
    expect(subject).to be_valid
  end
end