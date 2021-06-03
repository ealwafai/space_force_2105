require 'rspec'
require './lib/spacecraft'
require './lib/person'
require './lib/flotilla'

describe Flotilla do
  it 'exists' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    expect(seventh_flotilla).to be_a(Flotilla)
  end

  it 'has attributes' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    expect(seventh_flotilla.name).to eq('Seventh Flotilla')
    expect(seventh_flotilla.personnel).to eq([])
    expect(seventh_flotilla.ships).to eq([])
  end

  it 'can add daedalus ships' do
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})

    seventh_flotilla.add_ship(daedalus)

    expect(seventh_flotilla.ships).to eq([daedalus])
  end

  it 'can add personnel' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expect(seventh_flotilla.personnel).to eq([kathy, polly, rover, sampson])
  end

  it 'can recommend personnel to daedulus based on specialty and experience' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    daedalus = Spacecraft.new({name: 'Daedalus', fuel: 400})

    seventh_flotilla.add_ship(daedalus)

    daedalus.add_requirement({astrophysics: 6})
    daedalus.add_requirement({quantum_mechanics: 3})

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expect(seventh_flotilla.recommend_personnel(daedalus)).to eq([kathy, sampson])
  end

  it 'can recommend personnel to odyssey based on specialty and experience' do
    seventh_flotilla = Flotilla.new({designation: 'Seventh Flotilla'})
    odyssey = Spacecraft.new({name: 'Odyssey', fuel: 300})

    seventh_flotilla.add_ship(odyssey)

    odyssey.add_requirement({operations: 6})
    odyssey.add_requirement({maintenance: 3})

    kathy = Person.new('Kathy Chan', 10)
    kathy.add_specialty(:astrophysics)
    kathy.add_specialty(:quantum_mechanics)

    polly = Person.new('Polly Parker', 8)
    polly.add_specialty(:operations)
    polly.add_specialty(:maintenance)

    rover = Person.new('Rover Henriette', 1)
    rover.add_specialty(:operations)
    rover.add_specialty(:maintenance)

    sampson = Person.new('Sampson Edwards', 7)
    sampson.add_specialty(:astrophysics)
    sampson.add_specialty(:quantum_mechanics)

    seventh_flotilla.add_personnel(kathy)
    seventh_flotilla.add_personnel(polly)
    seventh_flotilla.add_personnel(rover)
    seventh_flotilla.add_personnel(sampson)

    expect(seventh_flotilla.recommend_personnel(odyssey)).to eq([polly])
  end


end
