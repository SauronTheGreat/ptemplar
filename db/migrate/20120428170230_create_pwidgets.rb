class CreatePwidgets < ActiveRecord::Migration
  def change
    create_table :pwidgets do |t|
      t.string :name
      t.text :builder

      t.timestamps
    end
  end
end
