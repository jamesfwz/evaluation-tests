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
