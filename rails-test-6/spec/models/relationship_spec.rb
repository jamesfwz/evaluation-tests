require 'rails_helper'

describe Relationship do
  context 'validations' do
    it { is_expected.to validate_presence_of :person_id }
    it { is_expected.to validate_presence_of :member_id }
    it { is_expected.to validate_presence_of :member_type }
    it { is_expected.to enumerize(:member_type).in(:Father, :Mother) }

    describe 'uniqueness of father, mother' do 
      let!(:alex)      { create(:male, first_name: 'Alex') }
      let!(:alvin)     { create(:male, first_name: 'Alvin') }
      let!(:mason)     { create(:male, first_name: 'Mason') }
      let(:father_relationship)        { build(:father_relationship, person: alex, member: alvin) }
      let(:second_father_relationship) { build(:father_relationship, person: alex, member: mason) }

      it 'should be uniq' do 
        expect(father_relationship).to be_valid
        father_relationship.save
        expect(second_father_relationship).to be_invalid
      end
    end
  end

  context 'associations' do
    it { is_expected.to belong_to :person }
    it { is_expected.to belong_to :member }
  end

  describe '#ensure_valid_age' do 
    let(:father_relationship) { build(:father_relationship) }

    context 'valid' do
      let!(:peter)  { create(:male, first_name: 'Peter', dob: 22.years.ago) }

      it "Father must be greater than 20" do
        father_relationship.member = peter
        expect(father_relationship).to be_valid
      end
    end

    context 'invalid' do
      let!(:peter)  { create(:male, first_name: 'Peter', dob: 19.years.ago) }

      it "Father must be greater than 20" do
        father_relationship.member = peter
        expect(father_relationship).to be_invalid
      end
    end
  end
end
