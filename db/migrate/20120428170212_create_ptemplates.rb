class CreatePtemplates < ActiveRecord::Migration
  def change
    create_table :ptemplates do |t|
      t.string :name
      t.text :markup

      t.timestamps
    end
  end
end
