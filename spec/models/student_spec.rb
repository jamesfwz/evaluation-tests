require 'rails_helper'

describe Student do
  context 'associations' do
    it { is_expected.to have_and_belong_to_many :schools }
    it { is_expected.to have_many :schoolmates }
  end

  describe '#schoolmates' do
    let!(:school)  { create(:school) }
    let!(:james)   { create(:student, name: 'James',  schools: [school]) }
    let!(:oliver)  { create(:student, name: 'Oliver', schools: [school]) }
    let!(:theo)    { create(:student) }

    it 'returns a list of schoolmates' do
      expect(james.schoolmates).to include oliver
      expect(james.schoolmates).to_not include james
      expect(james.schoolmates).to_not include theo
    end
  end

  describe '#ensure_valid_age?' do
    let(:student) { build(:student) }

    context 'valid' do
      ['06/04/1990', '06/10/1995'].each do |dob|
        it "#{dob}" do
          student.dob = dob
          expect(student).to be_valid
        end
      end
    end

    context 'invalid' do
      ['06/04/2000', '06/10/2015'].each do |dob|
        it "#{dob}" do
          student.dob = dob
          expect(student).to_not be_valid
        end
      end
    end
  end
end
