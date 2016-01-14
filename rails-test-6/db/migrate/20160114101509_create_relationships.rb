class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :person_id, index: true
      t.belongs_to :father_id, index: true
      t.belongs_to :mother_id, index: true
    end
  end
end
