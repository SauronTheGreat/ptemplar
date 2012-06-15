class CreatePbehaviors < ActiveRecord::Migration
  def change
    create_table :pbehaviors do |t|
      t.integer :pcontent_id
      t.integer :pevent_id
      t.integer :pfragment_id
      t.text :markup

      t.timestamps
    end
  end
end
