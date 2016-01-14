require 'rails_helper'

describe Relationship do
  context 'validations' do
    it { is_expected.to validate_presence_of :person_id }
    it { is_expected.to validate_presence_of :member_id }
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to enumerize(:type).in(:Father, :Mother) }
  end

  context 'associations' do
    it { is_expected.to belong_to :person }
    it { is_expected.to belong_to :member }
  end
end
