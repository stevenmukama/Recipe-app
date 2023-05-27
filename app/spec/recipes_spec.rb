require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'Steve', email: 'steve@mail.com', password: 'password')
    Recipe.create(name: 'Samaki Fry', description: 'Hot and delicious', public: true, preparation_time: '1 hours',
                  cooking_time: '1 days', user: @user)
  end

  before(:each) { subject.save }

  it 'should have name recipe' do
    expect(subject.name).to eql('Samaki Fry')
  end

  it 'should have description "This is description"' do
    expect(subject.description).to eql('Hot and delicious')
  end


  it 'should have public of true' do
    expect(subject.public).to eql(true)
  end
end