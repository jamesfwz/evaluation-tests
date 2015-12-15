require 'rails_helper'

describe OfficeWorkerInfo do
  context 'validations' do
    it { is_expected.to validate_presence_of :start_working_on }
    it { is_expected.to validate_presence_of :office_worker_id }
  end

  context 'associations' do
    it { is_expected.to belong_to :office_worker }
  end

  describe '#ensure_valid_years_of_exp?' do
    let(:office_worker_info) { build(:office_worker_info) }

    context 'valid' do
      ['06/04/1990', '06/10/2000'].each do |start_working_on|
        it "#{start_working_on}" do
          office_worker_info.start_working_on = start_working_on
          expect(office_worker_info).to be_valid
        end
      end
    end

    context 'invalid' do
      ['06/04/2500', '06/10/2025'].each do |start_working_on|
        it "#{start_working_on}" do
          office_worker_info.start_working_on = start_working_on
          expect(office_worker_info).to_not be_valid
        end
      end
    end
  end
end
