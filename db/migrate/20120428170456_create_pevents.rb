class CreatePevents < ActiveRecord::Migration
  def change
    create_table :pevents do |t|
      t.string :name

      t.timestamps
    end
  end
end
