class CreatePslides < ActiveRecord::Migration
  def change
    create_table :pslides do |t|
      t.integer :user_id
      t.integer :ptemplate_id
      t.text :markup
      t.integer :pbehavior_id

      t.timestamps
    end
  end
end
