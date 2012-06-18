class CreateJoinTable < ActiveRecord::Migration
  def up
    create_table :groups_ptemplates, :id => false do |t|
      t.integer :ptemplate_id, :null => false
      t.integer :group_id, :null => false
    end
  end

  def down

  end
end
