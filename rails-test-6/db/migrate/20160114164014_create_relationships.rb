class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :person, index: true 
      t.belongs_to :member, index: true
      t.string :member_type
    end
  end
end
