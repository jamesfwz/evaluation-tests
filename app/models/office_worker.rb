class OfficeWorker < User
  has_one :info, class_name: OfficeWorkerInfo

  MIN_AGE = 20

  delegate :years_of_experience, to: :info, allow_nil: true
end
