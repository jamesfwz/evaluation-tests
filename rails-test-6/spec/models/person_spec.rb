require 'rails_helper'

describe Person do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :dob }
    it { is_expected.to validate_presence_of :gender }
    it { is_expected.to enumerize(:gender).in(:male, :female) }
  end

  context 'associations' do
    it { is_expected.to have_one :relationship }
    it { is_expected.to have_one :father }
    it { is_expected.to have_one :mother }
    it { is_expected.to have_many :children }
    it { is_expected.to have_many :parents }
    it { is_expected.to have_many :brothers }
  end

  describe 'relationships' do 
    let!(:alex)       { create(:person,   first_name: 'Alex') }

    describe '#father' do 
      let!(:mason)      { create(:male,     first_name: 'Mason') }
      let!(:father_relationship) { create(:father_relationship, person: alex, member: mason) }

      it 'returns father' do 
        expect(alex.father).to match mason.becomes(Father)
      end
    end

    describe '#mother' do 
      let!(:ava)        { create(:female,   first_name: 'Ava') }
      let!(:mother_relationship) { create(:mother_relationship, person: alex, member: ava) }
      
      it 'returns mother' do 
        expect(alex.mother).to match ava.becomes(Mother)
      end
    end

    describe '#children, #sons, #brothers' do 
      let!(:peter)  { create(:male,   first_name: 'Peter') }
      let!(:anna)   { create(:female, first_name: 'Anna') }

      before do 
        create(:father_relationship, person: peter, member: alex)
        create(:father_relationship, person: anna,  member: alex)
      end

      it 'returns children' do 
        expect(alex.children).to include anna.becomes(Child)
        expect(alex.children.size).to eq 2
      end
      
      it 'returns sons' do 
        expect(alex.sons).to include peter.becomes(Son)
        expect(alex.sons.size).to eq 1
      end

      it 'returns daughters' do 
        expect(alex.daughters).to include anna.becomes(Daughter)
        expect(alex.daughters.size).to eq 1
      end

      it 'returns brothers' do 
        expect(anna.brothers).to include peter.becomes(Brother)
        expect(anna.brothers.size).to eq 1
        expect(peter.brothers.size).to eq 0
      end
    end
  end

  describe '#father_of?' do 
    let!(:alex)   { create(:person, first_name: 'Alex') }
    let!(:mason)  { create(:male,   first_name: 'Mason') }
    let!(:father_relationship) { create(:father_relationship, person: alex, member: mason) }

    it 'true' do 
      expect(alex.father_of?(mason)).to be true
    end

    it 'false' do 
      expect(mason.father_of?(alex)).to be false
    end
  end

  describe '#set_name' do 
    let!(:person) { create(:person, first_name: "James", last_name: "La") }

    it 'sets full name before saving' do 
      expect(person.name).to eq 'James La'
    end
  end

  describe '#ensure_valid_age' do
    let(:person) { build(:person) }

    context 'valid' do
      [1.year.ago, 18.years.ago].each do |dob|
        it "#{dob}" do
          person.dob = dob
          expect(person).to be_valid
        end
      end
    end

    context 'invalid' do
      [1.year.from_now, 18.years.from_now].each do |dob|
        it "#{dob}" do
          person.dob = dob
          expect(person).to_not be_valid
        end
      end
    end
  end
end
