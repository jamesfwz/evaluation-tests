class CreateOfficeWorkerInfos < ActiveRecord::Migration
  def change
    create_table :office_worker_infos do |t|
      t.belongs_to :office_worker, index: true
      t.date :start_working_on
    end
  end
end
