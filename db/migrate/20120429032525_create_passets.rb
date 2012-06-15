class CreatePassets < ActiveRecord::Migration
  def change
    create_table :passets do |t|
      t.integer :pcontent_id
      t.string :media_passet_file_name
      t.string :caption
      t.text :markup

      t.timestamps
    end
  end
end
