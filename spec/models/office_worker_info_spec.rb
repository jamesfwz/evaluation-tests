require 'rails_helper'

describe OfficeWorkerInfo do
  context 'validations' do
    it { is_expected.to validate_presence_of :start_working_on }
    it { is_expected.to validate_presence_of :office_worker_id }
  end

  context 'associations' do
    it { is_expected.to belong_to :office_worker }
  end
end
