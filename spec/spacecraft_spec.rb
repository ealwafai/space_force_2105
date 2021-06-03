require 'rspec'
require './lib/spacecraft'

describe Spacecraft do
  it 'exists' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})

    expect(daedalus).to be_a(Spacecraft)
  end

  it 'has attributes' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})

    expect(daedalus.name).to eq('Daedalus')
    expect(daedalus.fuel).to eq(400)
    expect(daedalus.requirements).to eq([])
  end

  it 'can add requirements to daedalus' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})

    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})

    expect(daedalus.requirements).to eq([{astrophysics: 6}, {quantum_mechanics: 3}])
  end

  it 'can add requirements to odyssey' do
    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})

    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})

    expect(odyssey.requirements).to eq([{operations: 6}, {maintenance: 3}])
  end
end
