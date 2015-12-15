require 'rails_helper'

describe School do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to enumerize(:type).in(:primary_school, :secondary_school, :high_school, :university) }
  end

  context 'associations' do
    it { is_expected.to have_and_belong_to_many :students }
  end
end
