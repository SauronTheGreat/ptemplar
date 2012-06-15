class CreatePcontents < ActiveRecord::Migration
  def change
    create_table :pcontents do |t|
      t.integer :pslide_id
      t.integer :psection_id
      t.text :markup

      t.timestamps
    end
  end
end
