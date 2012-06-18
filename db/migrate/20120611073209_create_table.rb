class CreateTable < ActiveRecord::Migration
  def up
    create_table :ptemplates_pwidgets, :id => false do |t|
      t.integer :pwidget_id, :null => false
      t.integer :ptemplate_id, :null => false
    end

  end

  def down
  end
end
