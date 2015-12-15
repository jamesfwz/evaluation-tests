class OfficeWorker < User
  has_one :info, class_name: OfficeWorkerInfo

  MIN_AGE = 20
end
