require 'rails_helper'

describe Person do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :dob }
    it { is_expected.to validate_presence_of :gender }
    it { is_expected.to enumerize(:gender).in(:male, :female) }
  end

  describe '#set_name' do 
    let!(:person) { create(:person, first_name: "James", last_name: "La") }

    it 'sets full name before saving' do 
      expect(person.name).to eq 'James La'
    end
  end
end
