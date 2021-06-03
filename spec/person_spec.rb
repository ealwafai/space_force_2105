require 'rspec'
require './lib/person'

describe Person do
  it 'exists' do
    kathy = Person.new('Kathy Chan', 10)

    expect(kathy).to be_a(Person)
  end

  it 'has attributes' do
    kathy = Person.new('Kathy Chan', 10)

    expect(kathy.name).to eq('Kathy Chan')
    expect(kathy.experience).to eq(10)
  end
end
