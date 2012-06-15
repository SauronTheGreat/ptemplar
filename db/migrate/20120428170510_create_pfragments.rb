class CreatePfragments < ActiveRecord::Migration
  def change
    create_table :pfragments do |t|
      t.string :name
      t.text :markup

      t.timestamps
    end
  end
end
