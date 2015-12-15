require 'rails_helper'

describe OfficeWorker do
  describe '#ensure_valid_age?' do
    let(:office_worker) { build(:office_worker) }

    context 'valid' do
      ['06/04/1990', '06/10/1995'].each do |dob|
        it "#{dob}" do
          office_worker.dob = dob
          expect(office_worker).to be_valid
        end
      end
    end

    context 'invalid' do
      ['06/04/2000', '06/10/2015'].each do |dob|
        it "#{dob}" do
          office_worker.dob = dob
          expect(office_worker).to_not be_valid
        end
      end
    end
  end
end
