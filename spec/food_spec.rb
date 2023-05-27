require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    subject do
      @user = User.create(name: 'steve', email: 'steve@mail.com', password: 'password')
      Food.create(name: 'Corn', measurement_unit: 'grams', price: 2, user: @user)
    end

    before { subject.save }

    it 'should have the name "Corn"' do
      expect(subject.name).to eql('Corn')
    end

    it 'should have the measurement unit "grams"' do
      expect(subject.measurement_unit).to eql('grams')
    end

    it 'should always have a measurement unit present' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'should have a price of 2' do
      expect(subject.price).to eql(2)
    end

    it 'should always have a price present' do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it 'price should be greater than or equal to 0' do
      subject.price = -1
      expect(subject).to_not be_valid
    end

    it 'price should be a numeric value' do
      subject.price = 'string'
      expect(subject).to_not be_valid
    end
  end
end
