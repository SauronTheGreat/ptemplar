class CreatePsections < ActiveRecord::Migration
  def change
    create_table :psections do |t|
      t.integer :ptemplate_id
      t.integer :pwidget_id
      t.text :markup

      t.timestamps
    end
  end
end
