class AddColumnsToPbehavior < ActiveRecord::Migration
  def change
    add_column :pbehaviors,:prev_pcontent_id,:integer
    add_column :pbehaviors,:delay,:integer
  end
end
